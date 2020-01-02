-- Preliminary modifications to the DB
SET sql_mode = NO_AUTO_VALUE_ON_ZERO; 
INSERT INTO PATIENT (PAT_ID,PAT_FNAME,PAT_SNAME,PAT_NAME,PAT_BDATE,PAT_AGE,PAT_AGETYPE,PAT_SEX,PAT_ADDR,PAT_CITY,PAT_NEXT_KIN,PAT_TELE,PAT_MOTH_NAME,PAT_MOTH,PAT_FATH_NAME,PAT_FATH,PAT_LEDU,PAT_ESTA,PAT_PTOGE,PAT_NOTE,PAT_DELETED,PAT_LOCK,PAT_BTYPE,PAT_PHOTO,PAT_TAXCODE, PAT_MAR_STAT, PAT_PROFESSION) VALUES (0,'Patient','Null','Null Patient','-',0,'-','U','-','-','-','-','-','U','-','U',NULL,'U','U','-','Y',0,'-',NULL,'-','-','-');
ALTER TABLE PATIENT ADD COLUMN PAT_TIMESTAMP TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE ADMISSION CHANGE COLUMN ADM_DATE_ADM ADM_DATE_ADM DATETIME NOT NULL;
ALTER TABLE MEDICALDSRSTOCKMOVWARD
	CHANGE COLUMN MMVN_PAT_ID MMVN_PAT_ID INT(11) NULL,
	CHANGE COLUMN MMVN_PAT_AGE MMVN_PAT_AGE SMALLINT(6) NULL,
	CHANGE COLUMN MMVN_PAT_WEIGHT MMVN_PAT_WEIGHT FLOAT NULL;
	
-- Altering TABLES and creating FKs
-- on Windows system my.cnf should be set as follow:
-- lower_case_file_system = ON <-- automatically set by the system
-- lower_case_table_names = 1 <-- If you are using InnoDB tables, you should set this variable to 1 on all platforms to force names to be converted to lowercase.  

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

ALTER TABLE HOSPITAL ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE ADMISSION ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE DISCHARGETYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE DELIVERYTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE DELIVERYRESULTTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE ADMISSIONTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE OPERATION ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE OPERATIONTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE WARD ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE PREGNANTTREATMENTTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE DISEASE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE PATIENT ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE PRICELISTS ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE BILLS ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE PRICES ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE BILLITEMS ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE BILLPAYMENTS ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE EXAM ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE EXAMTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE EXAMROW ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE LABORATORY ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE LABORATORYROW ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSR ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRSTOCKMOV ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRLOT ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRSTOCKMOVTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRSTOCKMOVWARD ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE MEDICALDSRWARD ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE VACCINE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE VACCINETYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE PATIENTVACCINE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE OPERATION ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE OPERATIONTYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE DISEASETYPE ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
-- ALTER TABLE MALNUTRITIONCONTROL ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE OPD ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE THERAPIES ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE USER ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE USERGROUP ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;
ALTER TABLE VISITS ENGINE = INNODB, CONVERT TO CHARACTER SET utf8;

ALTER TABLE ADMISSION
	ADD CONSTRAINT FK_ADMISSION_DISCHARGETYPE
		FOREIGN KEY (ADM_DIST_ID_A )
	    REFERENCES DISCHARGETYPE (DIST_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_DELIVERYTYPE
	    FOREIGN KEY (ADM_PRG_DLT_ID_A )
	    REFERENCES DELIVERYTYPE (DLT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_DELIVERYRESULTTYPE
	    FOREIGN KEY (ADM_PRG_DRT_ID_A )
	    REFERENCES DELIVERYRESULTTYPE (DRT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_ADMISSIONTYPE
	    FOREIGN KEY (ADM_ADMT_ID_A_ADM )
	    REFERENCES ADMISSIONTYPE (ADMT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_OPERATION
	    FOREIGN KEY (ADM_OPE_ID_A )
	    REFERENCES OPERATION (OPE_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_WARD
	    FOREIGN KEY (ADM_WRD_ID_A )
	    REFERENCES WARD (WRD_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_PREGNANTTREATMENTTYPE
	    FOREIGN KEY (ADM_PRG_PTT_ID_A )
	    REFERENCES PREGNANTTREATMENTTYPE (PTT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_IN_DISEASE
	    FOREIGN KEY (ADM_IN_DIS_ID_A )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_OUT_DISEASE1
	    FOREIGN KEY (ADM_OUT_DIS_ID_A )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_OUT_DISEASE2
	    FOREIGN KEY (ADM_OUT_DIS_ID_A_2 )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_OUT_DISEASE3
	    FOREIGN KEY (ADM_OUT_DIS_ID_A_3 )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
	ADD CONSTRAINT FK_ADMISSION_PATIENT
	    FOREIGN KEY (ADM_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
    
ALTER TABLE BILLS
	ADD CONSTRAINT FK_BILLS_PATIENT
	    FOREIGN KEY (BLL_ID_PAT )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
  	ADD CONSTRAINT FK_BILLS_PRICELISTS
	    FOREIGN KEY (BLL_ID_LST )
	    REFERENCES PRICELISTS (LST_ID )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION;
	    
ALTER TABLE PRICES
	ADD CONSTRAINT FK_PRICES_PRICELISTS
	    FOREIGN KEY (PRC_LST_ID )
	    REFERENCES PRICELISTS (LST_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
    
ALTER TABLE BILLITEMS
    ADD CONSTRAINT FK_BILLITEMS_BILLS
	    FOREIGN KEY (BLI_ID_BILL )
	    REFERENCES BILLS (BLL_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
	    
ALTER TABLE BILLPAYMENTS
	ADD CONSTRAINT FK_BILLPAYMENTS_BILLS
	    FOREIGN KEY (BLP_ID_BILL )
	    REFERENCES BILLS (BLL_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
	    
ALTER TABLE EXAM 
    ADD CONSTRAINT FK_EXAM_EXAMTYPE
	    FOREIGN KEY (EXA_EXC_ID_A )
	    REFERENCES EXAMTYPE (EXC_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE EXAMROW
    ADD CONSTRAINT FK_EXAMROW_EXAM
	    FOREIGN KEY (EXR_EXA_ID_A )
	    REFERENCES EXAM (EXA_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE LABORATORY    
    ADD CONSTRAINT FK_LABORATORY_EXAM
    	FOREIGN KEY (LAB_EXA_ID_A )
    	REFERENCES EXAM (EXA_ID_A )
    	ON DELETE NO ACTION
    	ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_LABORATORY_PATIENT
	    FOREIGN KEY (LAB_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
	    
ALTER TABLE LABORATORYROW	    
	ADD CONSTRAINT FK_LABORATORYROW_LABORATORY
	    FOREIGN KEY (LABR_LAB_ID )
	    REFERENCES LABORATORY (LAB_ID )
	    ON DELETE NO ACTION
		ON UPDATE CASCADE;

ALTER TABLE MEDICALDSR 
    ADD CONSTRAINT FK_MEDICALDSR_MEDICALDSRTYPE
	    FOREIGN KEY (MDSR_MDSRT_ID_A )
	    REFERENCES MEDICALDSRTYPE (MDSRT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE MEDICALDSRSTOCKMOV
    ADD CONSTRAINT FK_MEDICALDSRSTOCKMOV_MEDICALDSR
	    FOREIGN KEY (MMV_MDSR_ID )
	    REFERENCES MEDICALDSR (MDSR_ID )
	    ON DELETE NO ACTION
    	ON UPDATE NO ACTION,
    ADD CONSTRAINT FK_MEDICALDSRSTOCKMOV_MEDICALDSRSTOCKMOVTYPE
	    FOREIGN KEY (MMV_MMVT_ID_A )
	    REFERENCES MEDICALDSRSTOCKMOVTYPE (MMVT_ID_A )
	    ON DELETE NO ACTION
    	ON UPDATE NO ACTION, 
 	ADD CONSTRAINT FK_MEDICALDSRSTOCKMOV_WARD
	    FOREIGN KEY (MMV_WRD_ID_A )
	    REFERENCES WARD (WRD_ID_A )
	    ON DELETE NO ACTION
    	ON UPDATE NO ACTION;

ALTER TABLE MEDICALDSRSTOCKMOVWARD  	
    ADD CONSTRAINT FK_MEDICALDSRSTOCKMOVWARD_WARD
	    FOREIGN KEY (MMVN_WRD_ID_A )
	    REFERENCES WARD (WRD_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_MEDICALDSRSTOCKMOVWARD_PATIENT
	    FOREIGN KEY (MMVN_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;

ALTER TABLE MEDICALDSRWARD  	    
 	ADD CONSTRAINT FK_MEDICALDSRWARD_WARD
	    FOREIGN KEY (MDSRWRD_WRD_ID_A )
	    REFERENCES WARD (WRD_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_MEDICALDSRWARD_MEDICALDSR
	    FOREIGN KEY (MDSRWRD_MDSR_ID )
	    REFERENCES MEDICALDSR (MDSR_ID )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION;
	    
ALTER TABLE VACCINE 
    ADD CONSTRAINT FK_VACCINE_VACCINETYPE
	    FOREIGN KEY (VAC_VACT_ID_A )
	    REFERENCES VACCINETYPE (VACT_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE PATIENTVACCINE
	ADD CONSTRAINT FK_PATIENTVACCINE_PATIENT
	    FOREIGN KEY (PAV_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
    	ON UPDATE CASCADE,
  	ADD CONSTRAINT FK_PATIENTVACCINE_VACCINE
	    FOREIGN KEY (PAV_VAC_ID_A )
	    REFERENCES VACCINE (VAC_ID_A )
	    ON DELETE NO ACTION
    	ON UPDATE NO ACTION;
    	
ALTER TABLE OPERATION
	ADD CONSTRAINT FK_OPERATION_OPERATIONTYPE
	    FOREIGN KEY (OPE_OCL_ID_A )
	    REFERENCES OPERATIONTYPE (OCL_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE DISEASE 
    ADD CONSTRAINT FK_DISEASE_DISEASETYPE
	    FOREIGN KEY (DIS_DCL_ID_A )
	    REFERENCES DISEASETYPE (DCL_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
   
-- ALTER TABLE MALNUTRITIONCONTROL 
--    ADD CONSTRAINT FK_MALNUTRITIONCONTROL_ADMISSION
--	    FOREIGN KEY (MLN_ADM_ID )
--	    REFERENCES ADMISSION (ADM_ID )
--	    ON DELETE CASCADE
--	    ON UPDATE CASCADE;
    
ALTER TABLE OPD     
    ADD CONSTRAINT FK_OPD_DISEASE
	    FOREIGN KEY (OPD_DIS_ID_A )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_OPD_DISEASE_2
	    FOREIGN KEY (OPD_DIS_ID_A_2 )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_OPD_DISEASE_3
	    FOREIGN KEY (OPD_DIS_ID_A_3 )
	    REFERENCES DISEASE (DIS_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE NO ACTION,
  	ADD CONSTRAINT FK_OPD_PATIENT
	    FOREIGN KEY (OPD_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
	    
ALTER TABLE THERAPIES 
    ADD CONSTRAINT FK_THERAPIES_PATIENT
	    FOREIGN KEY (THR_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE,
	ADD CONSTRAINT FK_THERAPIES_MDSR
  		FOREIGN KEY (THR_MDSR_ID)
  		REFERENCES MEDICALDSR (MDSR_ID)
  		ON DELETE NO ACTION
  		ON UPDATE NO ACTION;
    
ALTER TABLE USER     
    ADD CONSTRAINT FK_USER_USERGROUP
	    FOREIGN KEY (US_UG_ID_A )
	    REFERENCES USERGROUP (UG_ID_A )
	    ON DELETE NO ACTION
	    ON UPDATE CASCADE;
    
ALTER TABLE VISITS
    ADD CONSTRAINT FK_VISITS_PATIENT
	    FOREIGN KEY (VST_PAT_ID )
	    REFERENCES PATIENT (PAT_ID )
	    ON DELETE CASCADE
	    ON UPDATE CASCADE;
	    
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;