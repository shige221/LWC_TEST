public with sharing class GetData {
    @AuraEnabled
    public List<ProcessInstanceWorkitem> GetApproveData() {
        List<ProcessInstanceWorkitem> pendingApprovals = new List<ProcessInstanceWorkitem>();
        // Set<Id> approverIds = new Set<Id>();

        // // ログインユーザーのIDを取得
        // Id currentUserId = UserInfo.getUserId();
        // approverIds.add(currentUserId);

        // // ユーザーがメンバーであるキューのIDを取得
        // List<GroupMember> groupMembers = [
        //     SELECT GroupId 
        //     FROM GroupMember 
        //     WHERE UserOrGroupId = :currentUserId
        // ];
        
        // for (GroupMember gm : groupMembers) {
        //     approverIds.add(gm.GroupId);
        // }

        // 承認プロセスで承認待ちの項目を取得
        pendingApprovals = [
            SELECT Id, ProcessInstanceId, OriginalActorId, ActorId, Actor.Name, ProcessInstance.TargetObjectId
            FROM ProcessInstanceWorkitem
//            WHERE ActorId IN :approverIds
            WHERE ProcessInstance.Status = 'Pending'
        ];

        return pendingApprovals;
    }
}

