/**
* @author        Vasil Panovski
* @date          30.08.2018        
* @description   Interface that serves as template for every trigger events.
*/

public interface ITrigger {
    void BeforeInsert(List<SObject> newItems); 
 
    void BeforeUpdate(List<SObject> newList, Map<Id, SObject> newItems, List<SObject> oldList, Map<Id, SObject> oldItems);
 
    void BeforeDelete(List<SObject> oldList, Map<Id, SObject> oldItems); 
 
    void AfterInsert(List<SObject> newList, Map<Id, SObject> newItems);
 
    void AfterUpdate(List<SObject> newList, Map<Id, SObject> newItems, List<SObject> oldList, Map<Id, SObject> oldItems);
 
    void AfterDelete(List<SObject> oldList, Map<Id, SObject> oldItems);
 
    void AfterUndelete(List<SObject> newList, Map<Id, SObject> newItems);
 
    Boolean IsDisabled();
}
