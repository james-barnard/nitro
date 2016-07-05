--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: breweries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE breweries (
    id integer NOT NULL,
    region_id integer,
    name character varying,
    person_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: breweries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE breweries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: breweries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE breweries_id_seq OWNED BY breweries.id;


--
-- Name: consumer_purchases; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE consumer_purchases (
    id integer NOT NULL,
    consumer_id integer,
    pos_vehicle_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: consumer_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE consumer_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consumer_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE consumer_purchases_id_seq OWNED BY consumer_purchases.id;


--
-- Name: consumers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE consumers (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: consumers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE consumers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consumers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE consumers_id_seq OWNED BY consumers.id;


--
-- Name: local_products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE local_products (
    id integer NOT NULL,
    product_id integer,
    brewery_id integer,
    region_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: local_products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE local_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: local_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE local_products_id_seq OWNED BY local_products.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    name character varying,
    address_1 character varying,
    address_2 character varying,
    city character varying,
    state character varying,
    postal_code character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: organizations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE organizations (
    id integer NOT NULL,
    name character varying,
    cell_phone character varying,
    office_phone character varying,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE organizations_id_seq OWNED BY organizations.id;


--
-- Name: owners; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE owners (
    id integer NOT NULL,
    name character varying,
    cell_phone character varying,
    office_phone character varying,
    location_id integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE owners_id_seq OWNED BY owners.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    name character varying,
    cell_phone character varying,
    office_phone character varying,
    location_id integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: pos_vehicles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pos_vehicles (
    id integer NOT NULL,
    name character varying,
    access_code character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pos_vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pos_vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pos_vehicles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pos_vehicles_id_seq OWNED BY pos_vehicles.id;


--
-- Name: product_loads; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE product_loads (
    id integer NOT NULL,
    local_product_id integer,
    vending_machine_id integer,
    total_pours integer,
    date_loaded timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: product_loads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE product_loads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: product_loads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE product_loads_id_seq OWNED BY product_loads.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: regions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE regions_id_seq OWNED BY regions.id;


--
-- Name: route_drivers; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE route_drivers (
    id integer NOT NULL,
    name character varying,
    cell_phone character varying,
    office_phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: route_drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE route_drivers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: route_drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE route_drivers_id_seq OWNED BY route_drivers.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE routes (
    id integer NOT NULL,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    name character varying,
    role integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: vending_machines; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE vending_machines (
    id integer NOT NULL,
    model character varying,
    firmware_version character varying,
    location_id integer,
    route_id integer,
    owner character varying,
    last_serviced timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: vending_machines_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE vending_machines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: vending_machines_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE vending_machines_id_seq OWNED BY vending_machines.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY breweries ALTER COLUMN id SET DEFAULT nextval('breweries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY consumer_purchases ALTER COLUMN id SET DEFAULT nextval('consumer_purchases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY consumers ALTER COLUMN id SET DEFAULT nextval('consumers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY local_products ALTER COLUMN id SET DEFAULT nextval('local_products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations ALTER COLUMN id SET DEFAULT nextval('organizations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY owners ALTER COLUMN id SET DEFAULT nextval('owners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pos_vehicles ALTER COLUMN id SET DEFAULT nextval('pos_vehicles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_loads ALTER COLUMN id SET DEFAULT nextval('product_loads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY route_drivers ALTER COLUMN id SET DEFAULT nextval('route_drivers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY vending_machines ALTER COLUMN id SET DEFAULT nextval('vending_machines_id_seq'::regclass);


--
-- Name: breweries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY breweries
    ADD CONSTRAINT breweries_pkey PRIMARY KEY (id);


--
-- Name: consumer_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY consumer_purchases
    ADD CONSTRAINT consumer_purchases_pkey PRIMARY KEY (id);


--
-- Name: consumers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY consumers
    ADD CONSTRAINT consumers_pkey PRIMARY KEY (id);


--
-- Name: local_products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY local_products
    ADD CONSTRAINT local_products_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: organizations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: owners_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: pos_vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pos_vehicles
    ADD CONSTRAINT pos_vehicles_pkey PRIMARY KEY (id);


--
-- Name: product_loads_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY product_loads
    ADD CONSTRAINT product_loads_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: route_drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY route_drivers
    ADD CONSTRAINT route_drivers_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vending_machines_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vending_machines
    ADD CONSTRAINT vending_machines_pkey PRIMARY KEY (id);


--
-- Name: index_breweries_on_person_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_breweries_on_person_id ON breweries USING btree (person_id);


--
-- Name: index_breweries_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_breweries_on_region_id ON breweries USING btree (region_id);


--
-- Name: index_consumer_purchases_on_consumer_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consumer_purchases_on_consumer_id ON consumer_purchases USING btree (consumer_id);


--
-- Name: index_consumer_purchases_on_pos_vehicle_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_consumer_purchases_on_pos_vehicle_id ON consumer_purchases USING btree (pos_vehicle_id);


--
-- Name: index_local_products_on_brewery_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_local_products_on_brewery_id ON local_products USING btree (brewery_id);


--
-- Name: index_local_products_on_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_local_products_on_product_id ON local_products USING btree (product_id);


--
-- Name: index_local_products_on_region_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_local_products_on_region_id ON local_products USING btree (region_id);


--
-- Name: index_organizations_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_organizations_on_location_id ON organizations USING btree (location_id);


--
-- Name: index_owners_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_owners_on_location_id ON owners USING btree (location_id);


--
-- Name: index_owners_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_owners_on_organization_id ON owners USING btree (organization_id);


--
-- Name: index_people_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_people_on_location_id ON people USING btree (location_id);


--
-- Name: index_people_on_organization_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_people_on_organization_id ON people USING btree (organization_id);


--
-- Name: index_product_loads_on_local_product_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_loads_on_local_product_id ON product_loads USING btree (local_product_id);


--
-- Name: index_product_loads_on_vending_machine_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_product_loads_on_vending_machine_id ON product_loads USING btree (vending_machine_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: index_vending_machines_on_location_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vending_machines_on_location_id ON vending_machines USING btree (location_id);


--
-- Name: index_vending_machines_on_route_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_vending_machines_on_route_id ON vending_machines USING btree (route_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_00a9a2d6e1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vending_machines
    ADD CONSTRAINT fk_rails_00a9a2d6e1 FOREIGN KEY (route_id) REFERENCES routes(id);


--
-- Name: fk_rails_0d73da6c47; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY local_products
    ADD CONSTRAINT fk_rails_0d73da6c47 FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: fk_rails_1bd3821114; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_loads
    ADD CONSTRAINT fk_rails_1bd3821114 FOREIGN KEY (local_product_id) REFERENCES local_products(id);


--
-- Name: fk_rails_1f6a5ea6e2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY vending_machines
    ADD CONSTRAINT fk_rails_1f6a5ea6e2 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_2bbdd3ce7d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY breweries
    ADD CONSTRAINT fk_rails_2bbdd3ce7d FOREIGN KEY (person_id) REFERENCES people(id);


--
-- Name: fk_rails_2e85b59f2e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY product_loads
    ADD CONSTRAINT fk_rails_2e85b59f2e FOREIGN KEY (vending_machine_id) REFERENCES vending_machines(id);


--
-- Name: fk_rails_40271a6430; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY organizations
    ADD CONSTRAINT fk_rails_40271a6430 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_5cdd9f6f62; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY breweries
    ADD CONSTRAINT fk_rails_5cdd9f6f62 FOREIGN KEY (region_id) REFERENCES regions(id);


--
-- Name: fk_rails_647dd68424; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT fk_rails_647dd68424 FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_7ccca40e64; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY consumer_purchases
    ADD CONSTRAINT fk_rails_7ccca40e64 FOREIGN KEY (pos_vehicle_id) REFERENCES pos_vehicles(id);


--
-- Name: fk_rails_b407487472; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY local_products
    ADD CONSTRAINT fk_rails_b407487472 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_c8fd8647c8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY local_products
    ADD CONSTRAINT fk_rails_c8fd8647c8 FOREIGN KEY (brewery_id) REFERENCES breweries(id);


--
-- Name: fk_rails_cc3c1c1fca; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people
    ADD CONSTRAINT fk_rails_cc3c1c1fca FOREIGN KEY (organization_id) REFERENCES organizations(id);


--
-- Name: fk_rails_d78aa01336; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY consumer_purchases
    ADD CONSTRAINT fk_rails_d78aa01336 FOREIGN KEY (consumer_id) REFERENCES consumers(id);


--
-- Name: fk_rails_eddb65b8c4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY owners
    ADD CONSTRAINT fk_rails_eddb65b8c4 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- Name: fk_rails_ee55dd5e09; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY people
    ADD CONSTRAINT fk_rails_ee55dd5e09 FOREIGN KEY (location_id) REFERENCES locations(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20160704015905');

INSERT INTO schema_migrations (version) VALUES ('20160704015908');

INSERT INTO schema_migrations (version) VALUES ('20160704015914');

INSERT INTO schema_migrations (version) VALUES ('20160704155916');

INSERT INTO schema_migrations (version) VALUES ('20160704155917');

INSERT INTO schema_migrations (version) VALUES ('20160704155919');

INSERT INTO schema_migrations (version) VALUES ('20160704155920');

INSERT INTO schema_migrations (version) VALUES ('20160704155921');

INSERT INTO schema_migrations (version) VALUES ('20160704155923');

INSERT INTO schema_migrations (version) VALUES ('20160704155924');

INSERT INTO schema_migrations (version) VALUES ('20160704155926');

INSERT INTO schema_migrations (version) VALUES ('20160704155927');

INSERT INTO schema_migrations (version) VALUES ('20160704155929');

INSERT INTO schema_migrations (version) VALUES ('20160704155930');

INSERT INTO schema_migrations (version) VALUES ('20160704155931');

INSERT INTO schema_migrations (version) VALUES ('20160704155933');

INSERT INTO schema_migrations (version) VALUES ('20160704155934');

INSERT INTO schema_migrations (version) VALUES ('20160704155936');

