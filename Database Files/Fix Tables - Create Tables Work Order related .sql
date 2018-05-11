drop TABLE Fact_WorkOrderRouting
;
drop TABLE Fact_WorkOrder_Rejects
;
drop TABLE Fact_WorkOrderRouting_Rejects
;
CREATE TABLE Fact_WorkOrderRouting (
       WorkOrderRoutingSK int AUTO_INCREMENT NOT NULL,
       WorkOrderSK int NOT NULL,
       ProductSK int NOT NULL,
       OperationSequence int NOT NULL,
       LocationSK int NOT NULL,

       ScheduledStartDate datetime(3) NOT NULL,
       ScheduledEndDate datetime(3) NOT NULL,
       ActualStartDate datetime(3) NULL,
       ActualEndDate datetime(3) NULL,

       ScheduledStartDateSK int NOT NULL,
       ScheduledEndDateSK int NOT NULL,
       ActualStartDateSK int NULL,
       ActualEndDateSK int NULL,

       ActualResourceHrs numeric(9,4)     NULL, 
       PlannedCost numeric(15,2)     NULL, 
       ActualCost numeric(15,2)     NULL, 

        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (WorkOrderRoutingSK ASC)    -- fix
);

CREATE TABLE Fact_WorkOrder_Rejects
(
        RejectWorkOrderRoutingSK int AUTO_INCREMENT NOT NULL,
        WorkOrderSK int  NULL,
	WorkOrderID int NULL,
	ProductSK int NULL,   -- dw dimension
	OrderQty int NULL,
	StockedQty  int null default 0,
	ScrappedQty int NULL,

	WorkOrder_StartDateSK int NULL,
	WorkOrder_EndDateSK int NULL,
	WorkOrder_DueDateSK int NULL,

	StartDate datetime(3) NULL,
	EndDate datetime(3) NULL,
	DueDate datetime(3) NULL,

	ProductID int NULL,   

	ScrapReasonSK int NULL,  -- dw dimension

        DI_Reject_SK         int             DEFAULT -1 NOT NULL,
        DI_Rejects            varchar(80) NULL,
   
        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (RejectWorkOrderRoutingSK ASC)  -- fix
);

CREATE TABLE Fact_WorkOrderRouting_Rejects (
        RejectWorkOrderRoutingSK int AUTO_INCREMENT NOT NULL,
       WorkOrderSK int NULL,
       ProductSK int NULL,
       OperationSequence int NULL,
       LocationSK int NULL,

       ScheduledStartDate datetime(3) NULL,
       ScheduledEndDate datetime(3) NULL,
       ActualStartDate datetime(3) NULL,
       ActualEndDate datetime(3) NULL,

       ScheduledStartDateSK int NULL,
       ScheduledEndDateSK int NULL,
       ActualStartDateSK int NULL,
       ActualEndDateSK int NULL,

       ActualResourceHrs numeric(9,4)     NULL, 
       PlannedCost numeric(15,2)     NULL, 
       ActualCost numeric(15,2)     NULL, 

       WorkOrderID int NULL,
       ProductID int NULL,
       LocationID int NULL,

        DI_Reject_SK         int             DEFAULT -1 NOT NULL,
        DI_Rejects            varchar(80) NULL,
   
        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (RejectWorkOrderRoutingSK ASC)
);
