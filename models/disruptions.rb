require 'cause_area'
module QQ_Test
  class Disruptions
    include DataMapper::Resource
    property :id,    Serial, :key => true
    property :disruption_id,    Integer
    property :status,      String
    property :severity,      String
    property :level_Of_interest,      String
    property :category,      String
    property :sub_category,      String
    property :start_time, DateTime
    property :end_time, DateTime
    property :location,      String
    property :comments,      String
    property :current_update, String
    property :corridor, String
    property :remark_time, DateTime
    property :last_mod_time, DateTime


    property :created_at,   DateTime, :index => true

    has 1, :cause_area
    has 1, :display_point, through: :cause_area
    has n, :streets, through: :cause_area

  end
end

<<-XML
<status>Active</status>
<severity>Moderate</severity>
<levelOfInterest>Medium</levelOfInterest>
<category>Works</category>
<subCategory>Utility</subCategory>
<startTime>2016-04-12T08:30:00Z</startTime>
<endTime>2016-04-14T14:30:00Z</endTime>
<location>[A408] Sipson Road (UB7) (Hillingdon)</location>
<comments>
[A408] Sipson Road (UB7) (All Directions) at the junction of Doghurst Drive - Lane restrictions in place to facilitate telecommunications work.
</comments>
<currentUpdate>
Expect possible delays on the approach, when the lane restriction is in place.
</currentUpdate>
<remarkTime>2016-04-12T12:33:34Z</remarkTime>
<lastModTime>2016-04-12T12:33:34Z</lastModTime>
<CauseArea>
<DisplayPoint>
<Point>
<coordinatesEN>507760,177183</coordinatesEN>
<coordinatesLL>-.449539,51.483277</coordinatesLL>
</Point>
</DisplayPoint>
<Streets>
<Street>
<name>Doghurst Drive (UB7)</name>
<closure>Open</closure>
<directions>All Directions</directions>
<Link>
<toid>4000000030209572</toid>
<Line>
<coordinatesEN>507788,177105,507872.5,177150.25</coordinatesEN>
<coordinatesLL>-.449159,51.48257,-.447929,51.482961</coordinatesLL>
</Line>
</Link>
</Street>
<Street>
<name>[A408] Sipson Road (UB7)</name>
<closure>Open</closure>
<directions>All Directions</directions>
<Link>
<toid>4000000030309884</toid>
<Line>
<coordinatesEN>507752.511,176994.611,507788,177105</coordinatesEN>
<coordinatesLL>-.449704,51.481585,-.449159,51.48257</coordinatesLL>
</Line>
</Link>
<Link>
<toid>4000000030127669</toid>
<Line>
<coordinatesEN>507768,177173.5,507593.21,177302.041</coordinatesEN>
<coordinatesLL>-.449426,51.48319,-.451904,51.484379</coordinatesLL>
</Line>
</Link>
<Link>
<toid>4000000030309880</toid>
<Line>
<coordinatesEN>507788,177105,507768,177173.5</coordinatesEN>
<coordinatesLL>-.449159,51.48257,-.449426,51.48319</coordinatesLL>
</Line>
</Link>
</Street>
</Streets>
</CauseArea>
</Disruption>
XML
