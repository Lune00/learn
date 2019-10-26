select substr(trigger_name,1,20)  as nom_trigger, 
           trigger_type as type, 
           substr(base_object_type,1,8) as sur, 
           substr(table_name,1,10) as nom_objet, 
           substr(triggering_event,1,20) as evenement
from user_triggers;