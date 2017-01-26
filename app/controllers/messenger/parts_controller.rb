class PartController < ApplicationController
  def create
    Part.create(part_params)
  end

private
  def part_params
    params.require(:part).permit(:fb_user_id, :mid, :seq, :meaning, :part_type, :selection)
  end
end
