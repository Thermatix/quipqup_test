module QQ_Test
  module Converters

     Disruptions   = {
      'status' => :status,
      'severity' => :severity,
      'levelOfInterest' => :level_Of_interest,
      'category' => :category,
      'subCategory' => :sub_category,
      'startTime' => :start_time,
      'location' => :location,
      'comments' => :comments,
      'corridor' => :corridor,
      'currentUpdate' => :current_update,
      'remarkTime' => :remark_time,
      'lastModTime' => :last_mod_time
    }

    CauseArea = {

    }

    Streets = {

    }

    Street = {
      'name' => :name,
      'closure' => :closure,
      'directions' => :directions
    }
    DisplayPoint = {
      'point' => 'vector'
    }



    Link = {
      'toid' => :toid,
      'line' => 'vector'
    }


    Vector = {
      'coordinatesEN' => :en,
      'coordinatesLL' => :ll
    }


    Redirect = {
      'Line' => 'Vector',
      'Point' => 'Vector'
    }


  end
end
