USE [GIS]
GO

-- Latest Valid Query 2/7/2022
SELECT top 100 

       [CreationUser]  -- Yes
      ,[DateCreated]  -- Yes
      ,[InstallationDate] -- Yes
      ,[MeasuredLength]  --yes  good data
      ,[SC_Inspected_By] -- Yes
      ,[SC_Contractor]  --Yes
      ,[SC_Cut_Cap]     -- No ?

      ,[UMS_Location_Number] -- Is Asset ID in  Owan no UMS prefix 
      ,[Issue_Date]
      ,[Issued_By]
     
      ,[CALC_UMS_NUMBER]  -- is asset id in wam( Should Match)       
  FROM [gisadmin].[GAS_SERVICE]
 WHERE UMS_Location_Number is not Null
 
 /*  Intial Query

SELECT top 100 

    -- [OBJECTID]-- No
    -- ,[Enabled]   -- No 
       [CreationUser]  -- Yes
      ,[DateCreated]  -- Yes
      ,[InstallationDate] -- Yes
      ,[MeasuredLength]  --yes  good data
      ,[SC_Inspected_By] -- Yes
      ,[SC_Contractor]  --Yes
      ,[SC_Cut_Cap]     -- No ?
/*    ,[SC_Reactivate]
     ,[SC_Testing_Pressure]
      [SC_Test_Time]  -No ?
      ,[SC_Test_Gauge_Type]
      ,[SC_Size_Main_Tapped]
      ,[SC_Main_Material]
      ,[SC_Depth_of_Service]
      ,[SC_Service_Line_Material]
      ,[SC_Service_Line_Size]
      ,[SC_Dimension] */
      ,[UMS_Location_Number] -- Is Asset ID in  Owan no UMS prefix 
      ,[Issue_Date]
      ,[Issued_By]
     /* ,[Tap_Number] --No
      ,[SC_Type_Test]  
     ,[SC_PDF]
      ,[SC_PDF_3]
      ,[SC_PDF_4]  
      ,[Lifecycle]
      ,[SC_Remarks]
      ,[SynergenID]
      ,[SC_PDF_5] no
      ,[SC_PDF_6]
      ,[SC_PDF_2]  
      ,[EFV]
      ,[SC_Comments]
      ,[OperatingPressureDesc]
      ,[SC_Test_Pressure_Date]
       ,[created_user]  -- No 
      ,[created_date]
      ,[last_edited_user]
      ,[last_edited_date] 
      ,[WAM_ID] */
      ,[CALC_UMS_NUMBER]  -- is asset id in wam( Should Match)
      /*,[ACCOUNT_NO]
      ,[AREA_]
      ,[DEPARTMENT]
      ,[GlobalID]
      ,[Continuity_Check]
      ,[Anode_Size]
      ,[Leak_Repair_Date]
      ,[Replacement_Date]
       ,[Shape] --No
      ,[GDB_GEOMATTR_DATA]
      ,[PDF_WEB_1]
      ,[PDF_WEB_2]
      ,[PDF_WEB_3]
      ,[PDF_WEB_4]
      ,[PDF_WEB_5] No
      ,[PDF_WEB_6]
      ,[PDF_WEB_7]
      ,[PDF_WEB_8]
      ,[PDF_WEB_9]
      ,[PDF_WEB_10] */
  FROM [gisadmin].[GAS_SERVICE]
 WHERE UMS_Location_Number is not Null
 -- WHERE SHAPE IS NOT NULL

GO

 /* 
SELECT top 100
		MeasuredLength
     CreationUser 
      ,[DateCreated]
      ,[last_edited_user]
      ,[last_edited_date] 
	c
	   FROM [gisadmin].[GAS_SERVICE] WHERE MeasuredLength > 10

--	 00 WHERE len(CreationUser) > 5 -- is not null  
 */
