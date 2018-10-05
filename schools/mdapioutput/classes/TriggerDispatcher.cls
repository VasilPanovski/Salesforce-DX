/**
* @author        Vasil Panovski
* @date          30.08.2018          
* @description   Class primarily responsible in handling trigger execution per object.
*/
public class TriggerDispatcher {

   public static void run(ITrigger handler) {

        // If the trigger is disabled just return       
        if (handler.isDisabled())
            return;
        
        // Before trigger logic
        if (Trigger.IsBefore) {        
            if (Trigger.IsInsert)
                handler.beforeInsert(trigger.new);
            
            if (Trigger.IsUpdate)
                handler.beforeUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
            
            if (Trigger.IsDelete)
                handler.beforeDelete(trigger.old, trigger.oldMap);
        }
        
        // After trigger logic
        if (Trigger.IsAfter) {
            if (Trigger.IsInsert)
                handler.afterInsert(trigger.new, trigger.newMap);
            
            if (Trigger.IsUpdate)
                handler.afterUpdate(trigger.new, trigger.newMap, trigger.old, trigger.oldMap);
            
            if (trigger.IsDelete)
                handler.afterDelete(trigger.old, trigger.oldMap);
            
            if (trigger.isUndelete)
                handler.afterUndelete(trigger.new, trigger.newMap);
        }
    }
}
