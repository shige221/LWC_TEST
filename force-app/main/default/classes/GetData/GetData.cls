public with sharing class GetData {
    @AuraEnabled
    public List<ProcessInstanceWorkitem> GetApproveData() {
        List<ProcessInstanceWorkitem> pendingApprovals = new List<ProcessInstanceWorkitem>();
        
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

