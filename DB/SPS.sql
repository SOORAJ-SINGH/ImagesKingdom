USE [ImagesKingDown]
GO
/****** Object:  StoredProcedure [dbo].[USP_MANAGE_SUB_CATEGORY]    Script Date: 04/22/2014 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[USP_MANAGE_SUB_CATEGORY]

-- USER INPUT PARAMETTERS
@CALL_TYPE							INT=0,
@MAIN_CATEGORY_ID					INT=0,
@SUB_CATEGORY_NAME					VARCHAR(1000)='',
@SUB_CATEGORY_ID					INT=0


AS
BEGIN
	
	SET NOCOUNT ON;
	
		--**********************************************************************
		-- START: ADD NEW SUB CATEGORY
		--**********************************************************************
		IF (@CALL_TYPE = 1)
			BEGIN
				--ADD MAIN CATEGORY
				IF NOT EXISTS(SELECT SUB_CATEGORY_NAME FROM TBL_SUB_CATEGORY WHERE SUB_CATEGORY_NAME = @SUB_CATEGORY_NAME)	
				BEGIN	
					INSERT INTO TBL_SUB_CATEGORY
					(
						SUB_CATEGORY_NAME,MAIN_CATEGORY_ID										
					)
					VALUES
					(					
						@SUB_CATEGORY_NAME,@MAIN_CATEGORY_ID						
					)	
					SELECT 0 AS SUCCESS							
				END
			ELSE
				SELECT 1 AS SUCCESS		
		END
		--******************************************************************************
		-- FILL SUB CATEGORY LIST
		--******************************************************************************
		IF (@CALL_TYPE = 2)
		BEGIN
			SELECT *,MAIN_CATE_NAME
			FROM TBL_SUB_CATEGORY TSC
			LEFT JOIN TBL_MAIN_CATEGORY TMC ON TSC.MAIN_CATEGORY_ID=TMC.MAIN_CAT_ID		
			
			
		END
		
		
		

END
GO
/****** Object:  StoredProcedure [dbo].[USP_MANAGE_MAIN_CATEGORY]    Script Date: 04/22/2014 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		RUPAN GUPTA
-- Create date: 3 OCT 2009
-- Description:	ADMIN LOGIN CREATE AND LOGIN CHECK PROCESS
-- =============================================
CREATE PROCEDURE [dbo].[USP_MANAGE_MAIN_CATEGORY]

-- USER INPUT PARAMETTERS
@CALL_TYPE							INT=0,
@MAIN_CATEGORY_ID					INT=0,
@MAIN_CATEGORY_NAME					VARCHAR(500)=''

AS
BEGIN
	
	SET NOCOUNT ON;
	
		--**********************************************************************
		-- START: ADD NEW MAIN CATEGORY
		--**********************************************************************
		IF (@CALL_TYPE = 1)
			BEGIN
				--ADD MAIN CATEGORY
				IF NOT EXISTS(SELECT MAIN_CATE_NAME FROM TBL_MAIN_CATEGORY WHERE MAIN_CATE_NAME = @MAIN_CATEGORY_NAME)	
				BEGIN	
					INSERT INTO TBL_MAIN_CATEGORY
					(
						MAIN_CATE_NAME											
					)
					VALUES
					(					
						@MAIN_CATEGORY_NAME						
					)	
					SELECT 0 AS SUCCESS							
				END
			ELSE
				SELECT 1 AS SUCCESS		
		END
		--******************************************************************************
		-- FILL MAIN CATEGORY LIST
		--******************************************************************************
		IF (@CALL_TYPE = 2)
		BEGIN
			SELECT * FROM TBL_MAIN_CATEGORY		
		END
		
		
		

END
GO
/****** Object:  StoredProcedure [dbo].[USP_MANAGE_IMAGE_INFORMATION]    Script Date: 04/22/2014 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
CREATE PROCEDURE [dbo].[USP_MANAGE_IMAGE_INFORMATION]

-- USER INPUT PARAMETTERS
@CALL_TYPE							INT=0,
@IMAGE_ID							INT=0,
@IMAGE_TITLE						VARCHAR(500)='',
@IMAGE_CODE							VARCHAR(100)='',

@LARGE_PHOTO						VARCHAR(100)='',
@SUB_CATEGORY_ID					INT=0,
@KEYWORDS							VARCHAR(5000)='',
@STATUS								INT=0,
@REFF_IMAGES_ID						INT=0,
@SMALL_FILE_EXTENSION				varchar(50)='',
@LARGE_FILE_EXTENSION				varchar(50)=''





AS
BEGIN
	
	SET NOCOUNT ON;
	
		--**********************************************************************
		-- START: ADD NEW IMAGE DETAILS
		--**********************************************************************
		IF (@CALL_TYPE = 1)
			BEGIN
			DECLARE @CUR_PHOTO_ID varchar(50)
			DECLARE @SMALL_PHOTO_NAME VARCHAR(200)
			DECLARE @LARGE_PHOTO_NAME VARCHAR(200)
				--ADD IMAGE INFORMATION
				IF NOT EXISTS(SELECT IMAGE_CODE FROM TBL_IMAGES_INFORMATION WHERE IMAGE_CODE = @IMAGE_CODE)	
				BEGIN	
					INSERT INTO TBL_IMAGES_INFORMATION
					(
						IMAGE_TITLE,IMAGE_CODE,SUB_CATEGORY_ID,
						KEYWORDS,STATUS										
					)
					VALUES
					(					
						@IMAGE_TITLE,@IMAGE_CODE,@SUB_CATEGORY_ID,@KEYWORDS,@STATUS				
					)	
					SET @CUR_PHOTO_ID =(CONVERT(VARCHAR(50),(SELECT @@IDENTITY)))
					SET @SMALL_PHOTO_NAME=@IMAGE_CODE+'_sm'+@CUR_PHOTO_ID+'.'+@SMALL_FILE_EXTENSION
					SET @LARGE_PHOTO_NAME=@IMAGE_CODE+'_lr'+@CUR_PHOTO_ID+'.'+@LARGE_FILE_EXTENSION
					 
										
					UPDATE TBL_IMAGES_INFORMATION SET SMALL_PHOTO=@SMALL_PHOTO_NAME,LARGE_PHOTO=@LARGE_PHOTO_NAME
					WHERE IMAGE_ID=@CUR_PHOTO_ID
					
					
					SELECT @SMALL_PHOTO_NAME,@LARGE_PHOTO_NAME AS SUCCESS							
				END
			ELSE
				SELECT 0 AS SUCCESS		
		END
		--******************************************************************************
		-- FILL IMAGES LIST
		--******************************************************************************
		IF (@CALL_TYPE = 2)
		BEGIN
			SELECT * FROM TBL_IMAGES_INFORMATION
			
			
		END
		
		
		

END
GO
/****** Object:  StoredProcedure [dbo].[USP_ADD_MAIN_CATEGORY]    Script Date: 04/22/2014 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		RUPAN GUPTA
-- Create date: 3 OCT 2009
-- Description:	ADMIN LOGIN CREATE AND LOGIN CHECK PROCESS
-- =============================================
CREATE PROCEDURE [dbo].[USP_ADD_MAIN_CATEGORY]

-- USER INPUT PARAMETTERS
@CALL_TYPE					INT=0,
@MAIN_CATEGORY_ID					INT=0,
@MAIN_CATEGORY_NAME					VARCHAR(500)=''

AS
BEGIN
	
	SET NOCOUNT ON;
	
		--**********************************************************************
		-- START: ADD NEW MAIN CATEGORY
		--**********************************************************************
		IF (@CALL_TYPE = 1)
			BEGIN
				IF NOT EXISTS(SELECT MAIN_CATE_NAME FROM TBL_MAIN_CATEGORY WHERE MAIN_CATE_NAME = @MAIN_CATEGORY_NAME)	
				BEGIN	
					INSERT INTO TBL_MAIN_CATEGORY
					(
						MAIN_CATE_NAME
					
						
					)
					VALUES
					(					
						@MAIN_CATEGORY_NAME	
					
					)	
					SELECT 0 AS SUCCESS		
					
				END
			ELSE
				SELECT 1 AS SUCCESS		
		END
				
	


END
GO
/****** Object:  StoredProcedure [dbo].[SP_ADMIN_INFO]    Script Date: 04/22/2014 00:56:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		RUPAN GUPTA
-- Create date: 3 OCT 2009
-- Description:	ADMIN LOGIN CREATE AND LOGIN CHECK PROCESS
-- =============================================
CREATE PROCEDURE [dbo].[SP_ADMIN_INFO]

-- USER INPUT PARAMETTERS
@CALL_TYPE					INT=0,
@LOGIN_ID					INT=0,
@LOGIN_NAME					VARCHAR(50)='''',
@LOGIN_PASSWORD				VARCHAR(50)='''',
@LOGIN_TYPE					VARCHAR(50)='''',
@LOGIN_EMAILID				VARCHAR(50)=''''
		
AS
BEGIN
	
	SET NOCOUNT ON;
	
		--**********************************************************************
		-- START: NEW ADMIN INFORMATION SAVE
		--**********************************************************************
		IF (@CALL_TYPE = 1)
			BEGIN
				IF NOT EXISTS(SELECT LOGIN_NAME FROM ADMIN_LOGIN WHERE LOGIN_NAME = @LOGIN_NAME)	
				BEGIN	
					INSERT INTO LOGIN_NAME
					(
						LOGIN_NAME		,
						LOGIN_PASSWORD		,
						LOGIN_TYPE		,
						LOGIN_EMAILID	
						
					)
					VALUES
					(					
						@LOGIN_NAME		,
						@LOGIN_PASSWORD		,
						@LOGIN_TYPE		,
						@LOGIN_EMAILID	
						
					)	
					SELECT 0 AS SUCCESS		
					--SELECT @USER_ID=@@IDENTITY
					--SELECT @USER_ID FROM TBL_USER_INFO
				END
			ELSE
				SELECT 1 AS SUCCESS		
		END
				
	

		--**********************************************************************
		-- START: ADMIN LOGIN CHECK
		--**********************************************************************
		IF (@CALL_TYPE = 2)
			BEGIN
				SELECT LOGIN_NAME,LOGIN_TYPE FROM ADMIN_LOGIN 
				WHERE 
				LOGIN_NAME = @LOGIN_NAME	
				AND
				LOGIN_PASSWORD = @LOGIN_PASSWORD			
		END 



		--**********************************************************************
		-- START: EMAIL ID AND ADMIN NAME CHECK FOR FORGOT PASSWORD
		-- RECOVER PASSWORD
		--**********************************************************************
		


END -- MAIN END'
GO
