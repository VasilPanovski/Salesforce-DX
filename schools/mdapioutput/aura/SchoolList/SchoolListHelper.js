({
    fetchAllSchools : function(component, event, helper) {
        var action = component.get("c.getSchools");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                var schoolList = response.getReturnValue();
                component.set("v.schoolList", schoolList);
            } else {
                alert('Error in retriving school data')
            }
        });
        $A.enqueueAction(action);
    }
})
