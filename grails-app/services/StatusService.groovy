class StatusService {
	
    boolean transactional = true

    public Object createStatus(Status newStatus) {
        Date date = new Date();
        newStatus.configurationItem.statuses.each{ status ->
            if(status.endDate > date){
                status.endDate = date
                status.save()
            }
        }

        newStatus.startDate = date
        newStatus.endDate = date + 100000
        return newStatus.save()
    }
}