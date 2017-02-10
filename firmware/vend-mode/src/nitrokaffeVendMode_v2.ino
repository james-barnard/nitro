//nitrokaffe.timed.pour.vend.mode.v2

#define STATUSERROR -1
#define STATUSBUSY  100
#define STATUSOK    200
#define MAXWAIT     500

enum Modes
{ mIDLE,
  mENABLED,
  mDEBOUNCE,
  mPOURING,
  mCOMPLETED
};

// inputs
int btnSecret  = D0;
int btnBRB     = D1;

// outputs
int relay1     = D3;
int relay2     = D4;
int enabledLED = D7;

// tuneables/globals
int delayMS      = 200;
int mode         = mIDLE;
int productRelay = relay1; // defaults to relay1
int pouring      = 0;
int pourTime     = 15;     // pour time = pourTime * delayMS / 10 seconds
int waitTimer    = 0;


void setup() {
    pinMode(btnBRB,     INPUT_PULLUP);
    pinMode(btnSecret,  INPUT_PULLUP);

    pinMode(enabledLED, OUTPUT);
    pinMode(relay1,     OUTPUT);
    pinMode(relay2,     OUTPUT);

    Particle.function("nitroCmd",nitroCMD);
}

void loop() {
    switch (mode) {
    case mIDLE:
        if (secretButtonPressed())
        {
            enable();
        }
        break;

    case mENABLED:
        wait();
        break;

    case mDEBOUNCE:
        debounce();
        break;

    case mPOURING:
        pour();
        break;
    }

    delay(delayMS);
}

void resetMode() {
    pouring   = 0;
    waitTimer = 0;
    mode      = mIDLE;
    digitalWrite(enabledLED, LOW);
    digitalWrite(productRelay, LOW);
}

void enable() {
    log("mode", "enabled");
    digitalWrite(enabledLED, HIGH);
    mode      = mENABLED;
    waitTimer = 0;
}

void wait() {
    if ( pourButtonPressed() ) {
        mode = mDEBOUNCE;
    } else if ( waitTimer >= MAXWAIT ) {
        log("mode", "timeout");
        resetMode();
    } else {
        waitTimer++;
    }
}

void debounce() {
    log("mode", "debounce");
    if ( pourButtonPressed() ) {
        startPour();
    } else {
        log("mode", "back to enabled");
        waitTimer++;
        mode = mENABLED;
    }
}

bool pourButtonPressed() {
    int val = digitalRead(btnBRB);
    return (val == LOW);
}

bool secretButtonPressed() {
    int val = digitalRead(btnSecret);
    return (val == LOW);
}

void startPour() {
    log("pour", "started");
    digitalWrite(productRelay, HIGH);
    mode = mPOURING;
    pouring = 0;
}

void pour() {
    pouring++;
    if ( pouring > pourTime ) {
        completePour();
    }
}

void completePour() {
    log("pour", "ended");
    resetMode();
}

// External Functions
int nitroCMD(String valve) {
    log("nitroCmd", valve);
    if ( mode == mIDLE ) {
        selectProduct(valve);
        enable();
        return STATUSOK;
    }
    return STATUSBUSY;
}

void selectProduct(String valve) {
    if (valve == "P1") {
        productRelay = relay1;
    } else {
        productRelay = relay2;
    }
}

void log(String label, String value) {
    Particle.publish(label, value);
    return;
}
