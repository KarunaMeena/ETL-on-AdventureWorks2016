-- AdventureWorksDW - purchasing & sales
-- dbms:     MySQL 
-- Modified: 2018-04-15
-- Rick Sherman
-- 
use AdventureWorksDW_neu
;

CREATE TABLE DimEmployeeSalaryHistory(
	EmployeeSalaryHistorySK int AUTO_INCREMENT NOT NULL,
	EmployeeSK int NOT NULL,
	PayFrequency int NULL,
	BaseRate numeric(15, 2) NULL,

        scd_start date NOT NULL,  
        scd_end date  DEFAULT NULL,
        scd_version int NOT NULL,
        scd_active int NOT NULL,
	
	SOR_ID int NOT NULL,
	SOR_LoadDate datetime(3) NULL,
	SOR_UpdateDate datetime(3) NULL,

	DI_Job_ID nvarchar(20) NOT NULL,
	DI_Create_Date datetime NOT NULL DEFAULT now(),
	DI_Modified_Date datetime NOT NULL DEFAULT now(),
PRIMARY KEY  (EmployeeSalaryHistorySK ASC)
) ON 
;

/* 
 * TABLE: Dim_SORSystem 
 */

CREATE TABLE Dim_SORSystem(
    SOR_ID       int             NOT NULL,
    SOR_Name            nchar(20)       NULL,
    SOR_Description     nchar(80)       NULL,
    SOR_Type            varchar(80)     NULL,
    SOR_DBMS            varchar(80)     NULL,
    SOR_DBName          varchar(80)     NULL,
    SOR_DBSchema        varchar(80)     NULL,
    SOR_FileType        varchar(80)     NULL,
    SOR_Filename        varchar(255)    NULL,
    SOR_AppName         varchar(255)    NULL,
    SOR_AppModule       varchar(255)    NULL,
    DI_Job_ID           nvarchar(20)    NULL,
    DI_Create_Date      datetime        DEFAULT now() NOT NULL,
    DI_Modified_Date    datetime        DEFAULT now() NOT NULL,
    PRIMARY KEY (SOR_ID)
);


CREATE TABLE Dim_RejectCodes(
    DI_Reject_SK           int              AUTO_INCREMENT NOT NULL,
    DI_RejectCode          int              NOT NULL,
    DI_RejectReason        nchar(80)        NULL, 
    DI_RejectDescription   nchar(255)      NULL,
    SOR_ID                  int              DEFAULT -1 NOT NULL,
    DI_Job_ID               nvarchar(20)     NOT NULL,
    DI_Create_Date          datetime         DEFAULT now() NOT NULL,
    DI_Modified_Date        datetime         DEFAULT now() NOT NULL,
    PRIMARY KEY (DI_Reject_SK)
);

/* ----------------------------------------------------  */
/****** Object:  Table dbo.DimSalesTerritory    ******/

CREATE TABLE DimSalesTerritory(
	SalesTerritorySK                  int AUTO_INCREMENT NOT NULL,
	SalesTerritoryID                  int NULL,  -- renamed SalesTerritoryAlternateKey      
	SalesTerritoryName                nvarchar(50) NOT NULL,
	CountryRegionCode                 nvarchar(3)  NOT NULL,
	SalesTerritoryGroup               nvarchar(50) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL ,
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (SalesTerritorySK ASC)    
); 


/****** Object:  Table dbo.DimGeography ******/

CREATE TABLE DimGeography(
	GeoSK                             int AUTO_INCREMENT NOT NULL,
	City                              nvarchar(30) NULL,
	StateProvinceCode                 nvarchar(3) NULL,
	StateProvinceName                 nvarchar(50) NULL,
        IsOnlyStateProvinceFlag           int NULL,      
	CountryRegionCode                 nvarchar(3) NULL,
	CountryRegionName                 nvarchar(50) NULL,
	PostalCode                        nvarchar(15) NULL,
	SalesTerritorySK                  int NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL ,
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (GeoSK)
);

/****** Object:  Table dbo.DimDate ******/

CREATE TABLE DimDate(
	DateSK             int NOT NULL,
	FullDateAK         date NOT NULL,
	DayNumberOfWeek    int NOT NULL,
	DayNameOfWeek      nvarchar(10) NOT NULL,
	DayNameOfWeekAbbr  nvarchar(3) NOT NULL,      
	DayNumberOfMonth   int NOT NULL,
	DayNumberOfYear    int NOT NULL,
	WeekNumberOfYear   int NOT NULL,
	MonthName          nvarchar(10) NOT NULL,
	MonthNameAbbr      nvarchar(3) NOT NULL,      
	MonthNumberOfYear  int NOT NULL,
	CalendarQuarter    int NOT NULL,
	CalendarYear       int NOT NULL,

        DI_Job_ID                         nvarchar(20)      NOT NULL ,    
        DI_Create_Date                    datetime       NOT NULL default now(),      
        DI_Modified_Date                  datetime       NOT NULL default now(),      
PRIMARY KEY (DateSK)
);


/****** Object:  Table DimProducts_Purchased ******/

CREATE TABLE DimProducts_Purchased 
(
    ProductPurchasedSK                int AUTO_INCREMENT not null, -- renamed ProductPurchasedSK  
    ProductID                         int               NOT NULL, -- ProductNK               
    ProductNumber                     varchar(25)       NULL,  -- ProductAK   
    ProductName                       varchar(50)       NULL, 
         
    ProductSubcategoryID              int               NULL, -- ProductSubcategoryNK
    ProductSubcategoryName            varchar(50)       NULL, 
    ProductCategoryID                 int               NULL, -- ProductCategoryNK
    ProductCategoryName               varchar(50)       NULL, 
    ProductModelID                    int               NULL, -- ProductModelNK
    ModelName                         varchar(50)       NULL,

    FinishedGoodsFlag                 int               NULL, 
    MakeFlag                          int               NULL, 
  
    StandardCost                      numeric(15,2)     NULL, 
    ListPrice                         numeric(15,2)     NULL,
    -- DealerPrice                     numeric(15,2)     NULL, 

    ProductLine                       char(2)           NULL,
    ProductClass                      char(2)           NULL,
    ProductStyle                      char(2)           NULL,

    WeightUnitMeasureCode             char(3)           NULL,
    SizeUnitMeasureCode               char(3)           NULL,
    ProductColor                      varchar(15)       NULL, 
    SafetyStockLevel                  int               NULL,
    ReorderPoint                      int               NULL,
    ProductSize                       varchar(50)       NULL,
    ProductWeight                     numeric(15,2)     NULL, 
    DaysToManufacture                 int               NULL,
    
    -- ProductDescription             varchar(400)      NULL, 
    SellStartDate                     date              NULL,
    SellEndDate                       date              NULL,
    DiscontinuedDate                  date              NULL, 

    SOR_ID                            int               NOT NULL DEFAULT -1,
    SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
    SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR

    DI_Job_ID                         nvarchar(20)      NOT NULL ,
    DI_Create_Date                    datetime       NOT NULL default now(),
    DI_Modified_Date                  datetime       NOT NULL default now(),
    PRIMARY KEY (ProductPurchasedSK)
);


/****** Object:  Table dbo.DimVendors ******/

CREATE TABLE DimVendors(
  VendorSK                 int AUTO_INCREMENT NOT NULL,
  BusinessEntityID          int NOT NULL,
  AccountNumber             varchar(15) NOT NULL,
  VendorName                varchar(50) NOT NULL,
  CreditRating              int NOT NULL,
  PreferredVendorStatus     varchar(1) NOT NULL,
  ActiveFlag                int NOT NULL,
  PurchasingWebServiceURL   varchar(1024) NULL,

  AddressTypeName           varchar(50) NOT NULL,
  AddressLine1              varchar(60) NOT NULL,
  AddressLine2              varchar(60) NULL,
  GeoSK                     int NULL,

  SOR_ID                            int               NOT NULL DEFAULT -1,
  SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
  SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
  DI_Job_ID                         nvarchar(20)      NOT NULL ,
  DI_Create_Date                    datetime       NOT NULL default now(),
  DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (VendorSK)
);

CREATE TABLE DimShipMethod(
  ShipMethodSK       int AUTO_INCREMENT  NOT NULL,
  ShipMethodID       int NOT NULL,
  ShipMethodName     nvarchar(50) NOT NULL,
  ShipBase           numeric(15, 2) NOT NULL,
  ShipRate           numeric(15, 2) NOT NULL,

  SOR_ID                            int               NOT NULL DEFAULT -1,
  SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
  SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
  DI_Job_ID                         nvarchar(20)      NOT NULL ,
  DI_Create_Date                    datetime       NOT NULL default now(),
  DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (ShipMethodSK)
);


/****** Object:  Table dbo.DimProductVendor ******/

CREATE TABLE DimProductVendor(
  ProductVendorSK                   int AUTO_INCREMENT NOT NULL,
  ProductPurchasedSK                int NULL,   -- renamed ProductSK    
  VendorSK                          int NULL,
  ProductID                         int NOT NULL,
  VendorID                          int NOT NULL,
  AverageLeadTime                   int NOT NULL,
  StandardPrice                     numeric(15,2) NOT NULL,
  LastReceiptCost                   numeric(15,2) NULL,
  LastReceiptDateSK                 int NULL,
  LastReceiptDate                   datetime(3) NULL,
  MinOrderQty                       int NOT NULL,
  MaxOrderQty                       int NOT NULL,
  OnOrderQty                        int NULL,
  UnitMeasureCode                   nchar(3) NOT NULL,

  SOR_ID                            int               NOT NULL DEFAULT -1,
  SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
  SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
  DI_Job_ID                         nvarchar(20)      NOT NULL ,
  DI_Create_Date                    datetime       NOT NULL default now(),
  DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (ProductVendorSK)
);


/****** Object:  Table DimEmployee  ******/
CREATE TABLE DimEmployee(
	EmployeeSK                        int AUTO_INCREMENT NOT NULL,
        BusinessEntityID                  int NOT NULL,   
	EmployeeNationalID                nvarchar(15) NULL,

	ManagerSK                         int NULL,
        ManagerBusinessEntityID           int NULL,   
	ManagerEmployeeNationalID         nvarchar(15) NULL,

	GeoSK                             int NULL,  
        SalesTerritorySK                  int NULL,
	AddressLine1                      nvarchar(60) NULL,   
	AddressLine2                      nvarchar(60) NULL,   
        AddressType                       nvarchar(50) NULL,   

        Purchase_Buyer                    int NOT NULL default 0, -- 1 means buys from vendors

	FirstName                         nvarchar(50) NOT NULL,
	LastName                          nvarchar(50) NOT NULL,
	MiddleName                        nvarchar(50) NULL,
	NameStyle                         int NULL,
	JobTitle                          nvarchar(50) NULL,  -- renamed 

	HireDate                          date NULL,
	BirthDate                         date NULL,
	LoginID                           nvarchar(256) NULL,
	EmailAddress                      nvarchar(50) NULL,
	Phone                             nvarchar(25) NULL,
	PhoneNumberType                   nvarchar(50) NULL,   
	MaritalStatus                     nchar(1) NULL,
	-- EmergencyContactName     nvarchar(50) NULL,
	-- EmergencyContactPhone    nvarchar(25) NULL,
	SalariedFlag                      int NULL,
	Gender                            nchar(1) NULL,

	PayFrequency                      int NULL,
	BaseRate                          numeric(15,2) NULL,

	VacationHours                     int NULL,
	SickLeaveHours                    int NULL,
	CurrentFlag                       int NOT NULL,

	SalesPersonFlag                   int NOT NULL,

	DepartmentName                    nvarchar(50) NULL,  -- current
	StartDate                         date NULL,
	EndDate                           date NULL,
	Status                            nvarchar(50) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL ,
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),

PRIMARY KEY (EmployeeSK)
); 



CREATE TABLE DimPayHistory(          
  PayHistorySK        int AUTO_INCREMENT  NOT NULL,

  EmployeeSK          int            NOT NULL,
  -- BusinessEntityID        int NOT NULL,
  -- RateChangeDate          datetime NOT NULL,
  Rate                numeric(15, 2) NOT NULL,
  PayFrequency        int            NOT NULL,
  ModifiedDate        datetime(3)       NOT NULL,

  scd_start           datetime(3)       NULL,  -- from SOR
  scd_end             datetime(3)       NULL,  -- from SOR
  scd_Version         int            NULL,  -- from SOR
  scd_Active          int            NULL,  -- from SOR

  SOR_ID              int            NULL DEFAULT -1,
  -- SOR_LoadDate      datetime          NULL,  -- from SOR
  -- SOR_UpdateDate    datetime          NULL,  -- from SOR
  DI_Job_ID           nvarchar(20)   NULL ,
  DI_Create_Date      datetime          NULL default CURRENT_TIMESTAMP,
  DI_Modified_Date    datetime          NULL default CURRENT_TIMESTAMP,
PRIMARY KEY (PayHistorySK)
);

/****** Object:  Table dbo.DimVendorContacts******/
CREATE TABLE DimVendorContacts(
        VendorContactsSK                  int AUTO_INCREMENT NOT NULL,
	Person_BusinessEntityID           int NOT NULL,  -- renamed VendorKey 
	VendorSK                          int NOT NULL,  -- renamed VendorKey 
	Vendor_BusinessEntityID           int NOT NULL,  -- renamed VendorKey 
	ContactType                       nvarchar(50) NOT NULL,
	Title                             nvarchar(8) NULL,
	FirstName                         nvarchar(50) NOT NULL,
	MiddleName                        nvarchar(50) NULL,
	LastName                          nvarchar(50) NOT NULL,
	Suffix                            nvarchar(10) NULL,
	PhoneNumber                       nvarchar(25) NULL,
	PhoneNumberType                   nvarchar(50) NULL,
	EmailAddress                      nvarchar(50) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL ,
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (VendorContactsSK)
); 

/****** Object:  Table dbo.FactPurchases ******/

CREATE TABLE FactPurchases(
     PurchaseSK              int AUTO_INCREMENT NOT NULL,
     PurchaseOrderID         int NOT NULL,   -- AK
     PurchaseOrderDetailID   int NOT NULL,   -- AK
     Status                  int NOT NULL,
     EmployeeSK              int NULL,
     VendorSK                int NULL,
     ShipMethodSK            int NULL,
     EmployeeID              int NOT NULL,
     VendorID                int NOT NULL,
     ShipMethodID            int NOT NULL,
     OrderDateSK             int NOT NULL,
     ShipDateSK              int NULL,
     OrderDate               datetime(3) NOT NULL,
     ShipDate                datetime(3) NULL,
     ProductPurchasedSK      int NOT NULL,    -- renamed 
     SubTotal                numeric(15,2) NOT NULL,
     TaxAmt                  numeric(15,2) NOT NULL,
     Freight                 numeric(15,2) NOT NULL,
     TotalDue                numeric(15,2) NOT NULL,
     DueDate                 datetime(3) NOT NULL,
     OrderQty                int NOT NULL,
     UnitPrice               numeric(15,2) NOT NULL,
     LineTotal               numeric(15,2) NOT NULL,
     ReceivedQty             int NOT NULL,
     RejectedQty             int NOT NULL,
     StockedQty              int NOT NULL,
     LineTaxAmount           numeric(15,2) NOT NULL,
     LineFreight             numeric(15,2) NOT NULL,
     LineTotalDue            numeric(15,2) NULL,

     SOR_ID                  int               NOT NULL DEFAULT -1,
     SOR_LoadDate            datetime(3)          NULL,  -- from SOR
     SOR_UpdateDate          datetime(3)          NULL,  -- from SOR
     DI_Job_ID               nvarchar(20)      NOT NULL ,
     DI_Create_Date          datetime       NOT NULL default now(),
     DI_Modified_Date        datetime       NOT NULL default now(),
PRIMARY KEY (PurchaseSK)
);

/****** Object:  Table dbo.FactPurchases ******/

CREATE TABLE FactPurchases_Rejects(
     PurchaseSK              int AUTO_INCREMENT NOT NULL,
     PurchaseOrderID         int NOT NULL,   -- AK
     PurchaseOrderDetailID   int NOT NULL,   -- AK
     Status                  int NOT NULL,
     EmployeeSK              int NULL,
     VendorSK                int NULL,
     ShipMethodSK            int NULL,
     EmployeeID              int NOT NULL,
     VendorID                int NOT NULL,
     ShipMethodID            int NOT NULL,
     OrderDateSK             int NOT NULL,
     ShipDateSK              int NULL,
     OrderDate               datetime(3) NOT NULL,
     ShipDate                datetime(3) NULL,
     ProductPurchasedSK      int NOT NULL,    -- renamed 
     SubTotal                numeric(15,2) NOT NULL,
     TaxAmt                  numeric(15,2) NOT NULL,
     Freight                 numeric(15,2) NOT NULL,
     TotalDue                numeric(15,2) NOT NULL,
     DueDate                 datetime(3) NOT NULL,
     OrderQty                int NOT NULL,
     UnitPrice               numeric(15,2) NOT NULL,
     LineTotal               numeric(15,2) NOT NULL,
     ReceivedQty             int NOT NULL,
     RejectedQty             int NOT NULL,
     StockedQty              int NOT NULL,
     LineTaxAmount           numeric(15,2) NOT NULL,
     LineFreight             numeric(15,2) NOT NULL,
     LineTotalDue            numeric(15,2) NULL,

     DI_Reject_SK         int             DEFAULT -1 NOT NULL,
     -- DI_Rejects            varchar(80) NULL,

     SOR_ID                  int               NOT NULL DEFAULT -1,
     SOR_LoadDate            datetime(3)          NULL,  -- from SOR
     SOR_UpdateDate          datetime(3)          NULL,  -- from SOR
     DI_Job_ID               nvarchar(20)      NOT NULL ,
     DI_Create_Date          datetime       NOT NULL default now(),
     DI_Modified_Date        datetime       NOT NULL default now(),
PRIMARY KEY (PurchaseSK)
);

CREATE TABLE DimLocation(
        LocationSK int AUTO_INCREMENT NOT NULL,
	LocationID int not null,
	LocationName varchar(50) NOT NULL,
	CostRate numeric(15,2) NOT NULL,
	Availability numeric(8,2) NOT NULL,
	ModifiedDate datetime(3) NOT NULL,

        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)             NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)             NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),
PRIMARY KEY (LocationSK)
);

CREATE TABLE DimScrapReason(
	ScrapReasonSK int AUTO_INCREMENT NOT NULL,
	ScrapReasonID int not null,
	ScrapReasonName varchar(50) NOT NULL,
        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)        NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (ScrapReasonSK ASC)
);

CREATE TABLE Fact_WorkOrder
(
        WorkOrderSK int AUTO_INCREMENT NOT NULL,
	WorkOrderID int NOT NULL,
	ProductSK int NOT NULL,   -- dw dimension
	OrderQty int NOT NULL,
	StockedQty  int not null default 0,
	ScrappedQty int NOT NULL,

	WorkOrder_StartDateSK int NOT NULL,
	WorkOrder_EndDateSK int NULL,
	WorkOrder_DueDateSK int NOT NULL,

	StartDate datetime(3) NOT NULL,
	EndDate datetime(3) NULL,
	DueDate datetime(3) NOT NULL,

	ScrapReasonSK int NULL,  -- dw dimension

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)        NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (WorkOrderSK ASC)
);

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
        -- DI_Rejects            varchar(80) NULL,
   
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
        -- DI_Rejects            varchar(80) NULL,
   
        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),

PRIMARY KEY (RejectWorkOrderRoutingSK ASC)
);


-- - sales-related

/****** Object:  Table dbo.DimProductsAll******/

CREATE TABLE DimProductsAll
(
    ProductSK                         int AUTO_INCREMENT not null,
    ProductID                         int               NOT NULL, -- ProductNK               
    ProductNumber                     varchar(25)       NULL,  -- ProductAK   
    ProductName                       varchar(50)       NULL, 
         
    ProductSubcategoryID              int               NULL, -- ProductSubcategoryNK
    ProductSubcategoryName            varchar(50)       NULL, 
    ProductCategoryID                 int               NULL, -- ProductCategoryNK
    ProductCategoryName               varchar(50)       NULL, 
    ProductModelID                    int               NULL, -- ProductModelNK
    ModelName                         varchar(50)       NULL,

    FinishedGoodsFlag                 int               NULL, 
    MakeFlag                          int               NULL, 
  
    StandardCost                      numeric(15,2)     NULL, 
    ListPrice                         numeric(15,2)     NULL,
    -- DealerPrice                     numeric(15,2)     NULL, 

    ProductLine                       char(2)           NULL,
    ProductClass                      char(2)           NULL,
    ProductStyle                      char(2)           NULL,

    WeightUnitMeasureCode             char(3)           NULL,
    SizeUnitMeasureCode               char(3)           NULL,
    ProductColor                      varchar(15)       NULL, 
    SafetyStockLevel                  int               NULL,
    ReorderPoint                      int               NULL,
    ProductSize                       varchar(50)       NULL,
    ProductWeight                     numeric(15,2)     NULL, 
    DaysToManufacture                 int               NULL,
    
    -- ProductDescription             varchar(400)      NULL, 
    SellStartDate                     date              NULL,
    SellEndDate                       date              NULL,
    DiscontinuedDate                  date              NULL, 

    SOR_ID                            int               NOT NULL DEFAULT -1,
    SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
    SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR

    DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
    DI_Create_Date                    datetime       NOT NULL default now(),
    DI_Modified_Date                  datetime       NOT NULL default now(),
    PRIMARY KEY (ProductSK)
)
;


/****** Object:  Table dbo.DimStore  ******/
CREATE TABLE DimStore
(
  ResellerSK           int AUTO_INCREMENT not null,
  ResellerID            int  not null,  -- NK
  ResellerName          varchar(50) NULL,
  SalesPersonID         int   null,
   
  AddressName            varchar(50) NULL,
  AddressType            varchar(50) NULL,
  AddressLine1           varchar(60) NULL,
  AddressLine2           varchar(60) NULL,
  GeoSK                  int         NULL,
   
  ContactType            varchar(50) NULL,
  Title                  varchar(8) NULL,
  FirstName              varchar(50) NULL,
  MiddleName             varchar(50) NULL,
  LastName               varchar(50) NULL,
  Suffix                 varchar(10) NULL,
  PhoneNumberType        varchar(50) NULL,
  Phone                  varchar(25) NULL,  
  EmailAddress           varchar(50) NULL,
  EmailPromotion         int NULL,
  
  BusinessName           varchar(50) NULL,
  AnnualSales            numeric(15,2) NULL,
  AnnualRevenue          numeric(15,2) NULL,
  BankName               varchar(50) NULL,
  BusinessType           varchar(20) NULL,
  YearOpened             int NULL,
  Specialty              varchar(50) NULL,
  SquareFeet             int NULL,
  Brands                 varchar(30) NULL,
  Internet               varchar(30) NULL,
  NumberEmployees        int NULL,
  
  SOR_ID                 int               NOT NULL DEFAULT -1,
  SOR_LoadDate           datetime(3)          NULL,  -- from SOR
  SOR_UpdateDate         datetime(3)          NULL,  -- from SOR

  DI_Job_ID              nvarchar(20)      NOT NULL default 'no_job_id',
  DI_Create_Date         datetime       NOT NULL default now(),
  DI_Modified_Date       datetime       NOT NULL default now(),
  PRIMARY KEY (ResellerSK)
)
;

/****** Object:  Table dbo.DimCustomerPerson ******/

CREATE TABLE DimCustomerPerson(
	CustomerSK int AUTO_INCREMENT NOT NULL,
	GeoSK int NULL,
	CustomerAlternateSK nvarchar(15) NOT NULL,
	Title nvarchar(8) NULL,
	FirstName nvarchar(50) NULL,
	MiddleName nvarchar(50) NULL,
	LastName nvarchar(50) NULL,
	NameStyle tinyint NULL,
	BirthDate date NULL,
	MaritalStatus nchar(1) NULL,
	Suffix nvarchar(10) NULL,
	Gender nvarchar(1) NULL,
	EmailAddress nvarchar(50) NULL,
	YearlyIncome numeric(15,2) NULL,
	TotalChildren int NULL,
	NumberChildrenAtHome int NULL,
	Education nvarchar(40) NULL,
	Occupation nvarchar(100) NULL,
	HouseOwnerFlag int NULL,
	NumberCarsOwned int NULL,
	AddressLine1 nvarchar(120) NULL,
	AddressLine2 nvarchar(120) NULL,
	Phone nvarchar(20) NULL,
	DateFirstPurchase date NULL,
	CommuteDistance nvarchar(15) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (CustomerSK ASC)
)
;


/****** Object:  Table dbo.DimCurrency  ******/

CREATE TABLE DimCurrency(
	CurrencySK int AUTO_INCREMENT NOT NULL,
	CurrencyAlternateSK nchar(3) NOT NULL,
	CurrencyName nvarchar(50) NOT NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (CurrencySK ASC)
)
;


/****** Object:  Table dbo.DimPromotion    Script Date: 6/26/2016 7:16:54 AM ******/
CREATE TABLE DimPromotion(
	PromotionSK int AUTO_INCREMENT NOT NULL,
	PromotionAlternateSK int NULL,
	PromotionName nvarchar(255) NULL,
	PromotionDiscountPct double NULL,
	PromotionType nvarchar(50) NULL,
	PromotionCategory nvarchar(50) NULL,
	PromotionStartDate datetime(3) NOT NULL,
	PromotionEndDate datetime(3) NULL,
	PromotionMinQty int NULL,
	PromotionMaxQty int NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (PromotionSK ASC)
)
;


/****** Object:  Table dbo.FactInternetSales    ******/

CREATE TABLE FactInternetSales(
	InternetSalesSK int AUTO_INCREMENT NOT NULL,
	ProductSK int NOT NULL,
	OrderDateSK int NOT NULL,
	DueDateSK int NOT NULL,
	ShipDateSK int NOT NULL,
	CustomerSK int NOT NULL,
	PromotionSK int NOT NULL,
	CurrencySK int NOT NULL,
	SalesTerritorySK int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber int NOT NULL,
	RevisionNumber int NOT NULL,
	OrderQuantity int NOT NULL,
	-- UnitPrice numeric(15,2) NOT NULL,
	ExtendedAmount numeric(15,2) NOT NULL,
	-- UnitPriceDiscountPct float NOT NULL,
	DiscountAmount double NOT NULL,
	-- ProductStandardCost numeric(15,2) NOT NULL,
	TotalProductCost numeric(15,2) NOT NULL,
	SalesAmount numeric(15,2) NOT NULL,
	TaxAmt numeric(15,2) NOT NULL,
	Freight numeric(15,2) NOT NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime(3) NULL,
	DueDate datetime(3) NULL,
	ShipDate datetime(3) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (InternetSalesSK ASC)
)
;

/****** Object:  Table dbo.FactStoreSales  ******/

CREATE TABLE FactStoreSales(
	InternetSalesSK int AUTO_INCREMENT NOT NULL,
	ProductSK int NOT NULL,
	OrderDateSK int NOT NULL,
	DueDateSK int NOT NULL,
	ShipDateSK int NOT NULL,
	ResellerSK int NOT NULL,
	EmployeeSK int NOT NULL,
	PromotionSK int NOT NULL,
	CurrencySK int NOT NULL,
	SalesTerritorySK int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber int NOT NULL,
	RevisionNumber int NULL,
	OrderQuantity int NULL,
	-- UnitPrice numeric(15,2) NULL,
	ExtendedAmount numeric(15,2) NULL,
	-- UnitPriceDiscountPct float NULL,
	DiscountAmount double NULL,
	-- ProductStandardCost numeric(15,2) NULL,
	TotalProductCost numeric(15,2) NULL,
	SalesAmount numeric(15,2) NULL,
	TaxAmt numeric(15,2) NULL,
	Freight numeric(15,2) NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime(3) NULL,
	DueDate datetime(3) NULL,
	ShipDate datetime(3) NULL,

        SOR_ID                            int               NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)      NOT NULL default 'no_job_id',
        DI_Create_Date                    datetime       NOT NULL default now(),
        DI_Modified_Date                  datetime       NOT NULL default now(),
PRIMARY KEY (InternetSalesSK ASC)
)
;

/****** Object:  Table dbo.FactInternetSales    ******/

CREATE TABLE FactInternetSales_Rejects(
	InternetSalesSK int AUTO_INCREMENT NOT NULL,
	ProductSK int NOT NULL,
	OrderDateSK int NOT NULL,
	DueDateSK int NOT NULL,
	ShipDateSK int NOT NULL,
	CustomerSK int NOT NULL,
	PromotionSK int NOT NULL,
	CurrencySK int NOT NULL,
	SalesTerritorySK int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber int NOT NULL,
	RevisionNumber int NOT NULL,
	OrderQuantity int NOT NULL,
	-- UnitPrice numeric(15,2) NOT NULL,
	ExtendedAmount numeric(15,2) NOT NULL,
	-- UnitPriceDiscountPct float NOT NULL,
	DiscountAmount double NOT NULL,
	-- ProductStandardCost numeric(15,2) NOT NULL,
	TotalProductCost numeric(15,2) NOT NULL,
	SalesAmount numeric(15,2) NOT NULL,
	TaxAmt numeric(15,2) NOT NULL,
	Freight numeric(15,2) NOT NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime(3) NULL,
	DueDate datetime(3) NULL,
	ShipDate datetime(3) NULL,

        DI_Reject_SK         int             DEFAULT -1 NOT NULL,
        -- DI_Rejects            varchar(80) NULL,
   
        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),
PRIMARY KEY (InternetSalesSK ASC)
)
;

/****** Object:  Table dbo.FactStoreSales  ******/

CREATE TABLE FactStoreSales_Rejects(
	InternetSalesSK int AUTO_INCREMENT NOT NULL,
	ProductSK int NOT NULL,
	OrderDateSK int NOT NULL,
	DueDateSK int NOT NULL,
	ShipDateSK int NOT NULL,
	ResellerSK int NOT NULL,
	EmployeeSK int NOT NULL,
	PromotionSK int NOT NULL,
	CurrencySK int NOT NULL,
	SalesTerritorySK int NOT NULL,
	SalesOrderNumber nvarchar(20) NOT NULL,
	SalesOrderLineNumber int NOT NULL,
	RevisionNumber int NULL,
	OrderQuantity int NULL,
	-- UnitPrice numeric(15,2) NULL,
	ExtendedAmount numeric(15,2) NULL,
	-- UnitPriceDiscountPct float NULL,
	DiscountAmount double NULL,
	-- ProductStandardCost numeric(15,2) NULL,
	TotalProductCost numeric(15,2) NULL,
	SalesAmount numeric(15,2) NULL,
	TaxAmt numeric(15,2) NULL,
	Freight numeric(15,2) NULL,
	CarrierTrackingNumber nvarchar(25) NULL,
	CustomerPONumber nvarchar(25) NULL,
	OrderDate datetime(3) NULL,
	DueDate datetime(3) NULL,
	ShipDate datetime(3) NULL,
        DI_Reject_SK         int             DEFAULT -1 NOT NULL,
        -- DI_Rejects            varchar(80) NULL,
   
        SOR_ID                            int                  NOT NULL DEFAULT -1,
        SOR_LoadDate                      datetime(3)          NULL,  -- from SOR
        SOR_UpdateDate                    datetime(3)          NULL,  -- from SOR
        DI_Job_ID                         nvarchar(20)         NOT NULL,
        DI_Create_Date                    datetime              NOT NULL default now(),
        DI_Modified_Date                  datetime              NOT NULL default now(),
PRIMARY KEY (InternetSalesSK ASC)
)
;






