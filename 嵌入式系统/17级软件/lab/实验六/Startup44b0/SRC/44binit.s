;/*
;************************************************************************************************************
;*				        				�������Ǵ�ʢ�Ƽ����޹�˾
;*                                     	     ��    ��    ��
;*
;*                                 	     http://www.techshine.com
;*
;*--------------------------------------------- �ļ���Ϣ ----------------------------------------------------                                      
;*
;* �ļ����� : 44binit.s	
;* �ļ����� : ���ļ�ΪARM7Ӳ��ƽ̨��C�����������룬���ڷ����ж���������ʼ��ISR��ַ����ʼ����ջ�ռ䣬
;*            ��ʼ��Ӧ�ó���ִ�л��������ô洢��ϵͳ���趨ʱ�����ڣ�������Ӧ�ó���
;* ����˵�� : ����S3C44B0��ARM7Ӳ��ƽ̨����������
;*-------------------------------------------- ���°汾��Ϣ -------------------------------------------------
;* �޸����� : ARM����С��
;* �޸����� : 2004/04/25
;* �汾���� : V1.0.1
;*-------------------------------------------- ��ʷ�汾��Ϣ -------------------------------------------------
;* �ļ����� : ARM����С��
;* �������� : 2004/04/20
;* �汾���� : v1.0.0
;*-----------------------------------------------------------------------------------------------------------
;*-----------------------------------------------------------------------------------------------------------
;************************************************************************************************************
;*/
 
    GET ..\inc\option.inc
    GET ..\inc\memcfg.inc
 
    IMPORT	|Image$$RO$$Limit|  		         ;// ��������ROM���е�RW��ַ(��:�洢RO��������ַ����һ��ַ)
    IMPORT	|Image$$RW$$Base|   		                                          ;// ��������RAM���Ŀ�ʼ��ַ
    IMPORT	|Image$$ZI$$Base|   		                                     ;// �����������ʼ�����Ŀ�ʼ��ַ
    IMPORT	|Image$$ZI$$Limit|  		                             ;// �����������ʼ������ĩ��ַ����һ��ַ

    IMPORT  Main    					                                           ;// ����������������ڵ�ַ
   
    AREA    Init,CODE,READONLY

    ENTRY 
    b ResetHandler  					                                               ;//�����õĳ�����ڵ�ַ
    b HandlerUndef  					 ;//��δ����������ַ����һ����ַ���õ�ַ��Ž���δ��������ӳ���ĵ�ַ
    b HandlerSWI    					 ;//�����ж�������ַ����һ����ַ���õ�ַ��Ž������жϷ����ӳ���ĵ�ַ
    b HandlerPabort 	 ;//��ָ��Ԥȡָ��ֹ������ַ����һ����ַ���õ�ַ��Ž���ָ��Ԥȡָ��ֹ�����ӳ���ĵ�ַ
    b HandlerDabort 				 ;//��������ֹ������ַ����һ����ַ���õ�ַ��Ž���������ֹ�����ӳ���ĵ�ַ
    b .		    						                                                           ;//ϵͳ����
    subs pc,lr,#4   					                                                   ;//ʹ�������жϷ�ʽ
    b HandlerFIQ						       ;//��FIQ������ַ����һ����ַ���õ�ַ��Ž���FIQ�����ӳ���ĵ�ַ
	
;/*********************************************** ע��! ******************************************************/

	   ;// ��������ж�ģʽʹ��, ��������ָ��Ӧ�������������Ӧ�ı�
	   ;// b HandlerIRQ  ->  subs pc,lr,#4
	   ;// b HandlerFIQ  ->  subs pc,lr,#4

;/******************************* S3C44B0X�жϿ������������жϵ�������ַ�� ***********************************/	
VECTOR_BRANCH
    ldr pc,=HandlerEINT0    																      ;//0x00000020
    ldr pc,=HandlerEINT1    																	  ;//0x00000024	
    ldr pc,=HandlerEINT2    																	  ;//0x00000028
    ldr pc,=HandlerEINT3    																	  ;//0x0000002C
    ldr pc,=HandlerEINT4567 																	  ;//0x00000030
    ldr pc,=HandlerTICK	    																	  ;//0x00000034
    
    	ldr pc,=HandlerDef																		  ;//0x00000038
    	ldr pc,=HandlerDef																		  ;//0x0000003C
    	
    ldr pc,=HandlerZDMA0    																	  ;//0x00000040
    ldr pc,=HandlerZDMA1    																	  ;//0x00000044
    ldr pc,=HandlerBDMA0    																	  ;//0x00000048
    ldr pc,=HandlerBDMA1    																	  ;//0x0000004C
    ldr pc,=HandlerWDT	    																	  ;//0x00000050
    ldr pc,=HandlerUERR01   																	  ;//0x00000054
    
    	ldr pc,=HandlerDef																		  ;//0x00000058
    	ldr pc,=HandlerDef																		  ;//0x0000005C
    	
    ldr pc,=HandlerTIMER0   																	  ;//0x00000060
    ldr pc,=HandlerTIMER1   																	  ;//0x00000064
    ldr pc,=HandlerTIMER2   																	  ;//0x00000068
    ldr pc,=HandlerTIMER3   																	  ;//0x0000006C
    ldr pc,=HandlerTIMER4   																	  ;//0x00000070
    ldr pc,=HandlerTIMER5   																	  ;//0x00000074
    
    	ldr pc,=HandlerDef																		  ;//0x00000078
    	ldr pc,=HandlerDef																		  ;//0x0000007C
    	
    ldr pc,=HandlerURXD0    																	  ;//0x00000080
    ldr pc,=HandlerURXD1    																	  ;//0x00000084
    ldr pc,=HandlerIIC	    																	  ;//0x00000088
    ldr pc,=HandlerSIO	    																	  ;//0x0000008C
    ldr pc,=HandlerUTXD0    																	  ;//0x00000090
    ldr pc,=HandlerUTXD1    																	  ;//0x00000094
    
    	ldr pc,=HandlerDef																		  ;//0x00000098
    	ldr pc,=HandlerDef																		  ;//0x0000009C
    	
    ldr pc,=HandlerRTC	    																	  ;//0x000000A0
    
    	ldr pc,=HandlerDef		    															  ;//0x000000A4
    	ldr pc,=HandlerDef			    														  ;//0x000000A8
    	ldr pc,=HandlerDef			    														  ;//0x000000AC
    	ldr pc,=HandlerDef			    														  ;//0x000000B0
    	ldr pc,=HandlerDef	    																  ;//0x000000B4
    	ldr pc,=HandlerDef																		  ;//0x000000B8
    	ldr pc,=HandlerDef																	      ;//0x000000BC
    	
    ldr pc,=HandlerADC	    																	  ;//0x000000C0
    
    	ldr pc,=HandlerDef			    														  ;//0x000000C4
    	ldr pc,=HandlerDef			    														  ;//0x000000C8
    	ldr pc,=HandlerDef			    														  ;//0x000000CC
    	ldr pc,=HandlerDef			    														  ;//0x000000D0
    	ldr pc,=HandlerDef		 																  ;//0x000000D4
    	ldr pc,=HandlerDef																		  ;//0x000000D8
    	ldr pc,=HandlerDef																		  ;//0x000000DC
    	
	ldr pc,=EnterPWDN       														  ;//0x000000E0 = EnterPWDN
    	LTORG	

HandlerFIQ      HANDLER  	HandleFIQ
HandlerIRQ		HANDLER  	HandleIRQ     															;//û��ʹ��!
HandlerUndef	HANDLER  	HandleUndef
HandlerSWI		HANDLER  	HandleSWI
HandlerDabort	HANDLER  	HandleDabort
HandlerPabort	HANDLER  	HandlePabort

HandlerADC      VHANDLER 	HandleADC
HandlerRTC      VHANDLER 	HandleRTC
HandlerUTXD1	VHANDLER 	HandleUTXD1
HandlerUTXD0	VHANDLER 	HandleUTXD0
HandlerSIO		VHANDLER 	HandleSIO
HandlerIIC		VHANDLER 	HandleIIC
HandlerURXD1	VHANDLER 	HandleURXD1
HandlerURXD0	VHANDLER 	HandleURXD0
HandlerTIMER5	VHANDLER 	HandleTIMER5
HandlerTIMER4	VHANDLER 	HandleTIMER4
HandlerTIMER3	VHANDLER 	HandleTIMER3
HandlerTIMER2	VHANDLER 	HandleTIMER2
HandlerTIMER1	VHANDLER 	HandleTIMER1
HandlerTIMER0	VHANDLER 	HandleTIMER0
HandlerUERR01	VHANDLER 	HandleUERR01
HandlerWDT	    VHANDLER 	HandleWDT
HandlerBDMA1	VHANDLER 	HandleBDMA1
HandlerBDMA0	VHANDLER 	HandleBDMA0
HandlerZDMA1	VHANDLER 	HandleZDMA1
HandlerZDMA0	VHANDLER 	HandleZDMA0
HandlerTICK	    VHANDLER 	HandleTICK
HandlerEINT4567	VHANDLER 	HandleEINT4567
HandlerEINT3	VHANDLER 	HandleEINT3
HandlerEINT2	VHANDLER	HandleEINT2
HandlerEINT1	VHANDLER 	HandleEINT1
HandlerEINT0	VHANDLER 	HandleEINT0

HandlerDef
     stmfd   sp!,{r0,r1}																		;//r0,r1��ջ
     ldr     r0,=I_PMST													 ;//���ж��������ȼ���������ַ����r0
     ldr     r1,[r0]																 ;//������������ݷ���r1
     str     r1,[r0]							             ;//�ѼĴ���r1�����ݷ����ж��������ȼ���������ַ
     ldmfd   sp!,{r0,r1}						                                ;//ԭr0,r1�����Ĵ������ݳ�ջ
     subs    pc,lr,#4							                                         ;//���ص�ԭִ�е�ַ
     
;/*
;************************************************************************************************************
;**						                         ����ʼ		                                           **
;************************************************************************************************************
;*/

ResetHandler
    ldr	    r0,=WTCON	    														;//�ѿ��Ź���ʱ����ַ��r0 
    mov     r1,#0x00             																	;//����ֵ		
    str	    r1,[r0]																	      ;//�رտ��Ź���ʱ��

    ldr	    r0,=INTMSK							                                  ;//�������жϼĴ�����ַ��r0 
    mov     r1,#0x07ffffff   					                                                    ;//����ֵ 
    str	    r1,[r0]								                                              ;//�ر������ж�
	
;/*
;************************************************************************************************************
;**	                                             ʱ�ӿ���������                                            **
;************************************************************************************************************
;*/
    
    ldr	r0,=LOCKTIME							                                  ;//������ʱ�䶨ʱ����ַ��r0
    ldr r1,=0x8fc;        						         ;//����ֵcount = t_lock * Fin = 230us * 10MHz = 2300
    str	r1,[r0]									                   ;//д������ʱ�䶨ʱ����PLL�ȶ�ʱ��Ϊ230 us

    [ PLLONSTART
	ldr	r0,=PLLCON								                                     ;//PLL���ƼĴ�����ַ��r0
	ldr	r1,=((M_DIV<<12) + (P_DIV<<4) + S_DIV)	                           ;//�趨���໷ Fin=10MHz,Fout=40MHz
	str	r1,[r0]									                                         ;//д��PLL���ƼĴ���
    ]

    ldr	    r0,=CLKCON							                                     ;//��ʱ�ӿ�������ַ��r0	 
    ldr	    r1,=0x7ff8							                              ;//���������赥Ԫ��ʱ�Ӵ򿪸�ֵ	
    str	    r1,[r0]								                                            ;//д��ʱ�ӿ�����
;/*
;************************************************************************************************************
;**			                                   DMA�Ĵ�������                                               ** 	
;************************************************************************************************************
;*/
    ldr     r0,=BDIDES0       
    ldr     r1,=0x40000000   													;//BDIDES0 ��λֵΪ 0x40000000	 
    str     r1,[r0]

    ldr     r0,=BDIDES1      
    ldr     r1,=0x40000000   													;//BDIDES1 ��λֵΪ 0x40000000	 
    str     r1,[r0]	
;/*
;************************************************************************************************************
;**			                                   �洢���Ĵ�������                                            ** 	
;************************************************************************************************************
;*/
    
    ldr	    r0,=SMRDATA							                                  ;//���������ݵĴ�ŵ�ַ����
    ldmia   r0!,{r1-r13}							                                            ;//����Ĵ���
    mov     r0,#0x01c80000            			                                        ;//�������߿�������ַ
    stmia   r0!,{r1-r13}							                                ;//��������ֵ����߿�����
    
;/*
;************************************************************************************************************
;**                                               ��ʼ����ջ                                               ** 
;************************************************************************************************************
;*/
    
    bl	    InitStacks
	
;/*
;************************************************************************************************************
;**                                          ��ʼ��Ӧ�ó���ִ�л���                                        **
;************************************************************************************************************
;*/
    
    LDR	    r0, =|Image$$RO$$Limit|				      ;//����ROM���е�RW��ַ(��:�洢RO��������ַ����һ��ַ)
    LDR	    r1, =|Image$$RW$$Base|				                                           ;//RAM���Ŀ�ʼ��ַ
    LDR	    r3, =|Image$$ZI$$Base|				                                      ;//���ʼ�����Ŀ�ʼ��ַ
			
    CMP	    r0, r1	    						                                         ;//�Ƚϵ�ַ�Ƿ���ͬ?
    BEQ	    %F1
0		
    CMP	    r1, r3	    						                                         ;//�Ƚϵ�ַ�Ƿ���ͬ?
    LDRCC   r2, [r0], #4    					                       ;//��ROM���е�RW��ַ�е����ݷ���Ĵ���		 
    STRCC   r2, [r1], #4    					 ;//�ѼĴ����е����ݷ���RAM���У�����󣬸պõ���ZI�����׵�ַ
    BCC	    %B0
1		
    LDR	    r1, =|Image$$ZI$$Limit| 			                              ;//���ʼ������ĩ��ַ����һ��ַ
    MOV	    r2, #0
2		
    CMP	    r3, r1	    						                                  ;//�����ʼ�����������ʼ��
    STRCC   r2, [r3], #4
    BCC	    %B2

;/*
;************************************************************************************************************
;**                                              ������Ӧ�ó���                                            **
;************************************************************************************************************
;*/
    
    b       Main
     
;/*
;************************************************************************************************************
;**                                          ��ջ��ʼ��Ӧ�ó���                                            **
;************************************************************************************************************
;*/    
InitStacks    
    MOV     R0, LR
																			      ;//���ù���ģʽ��ջ
    MSR     CPSR_c, # SVCMODE | NOINT
    LDR     SP, =StackSvc
												                                          ;//�����ж�ģʽ��ջ
    MSR     CPSR_c, #IRQMODE | NOINT
    LDR     SP, =StackIrq
												                                      ;//���ÿ����ж�ģʽ��ջ
    MSR     CPSR_c, #FIQMODE | NOINT
    LDR     SP, =StackFiq
												                                          ;//������ֹģʽ��ջ
    MSR     CPSR_c, #ABORTMODE | NOINT
    LDR     SP, =StackAbt
												                                        ;//����δ����ģʽ��ջ
    MSR     CPSR_c, #UNDEFMODE | NOINT
    LDR     SP, =StackUnd
												                                          ;//����ϵͳģʽ��ջ
    MSR     CPSR_c, #SYSMODE | NOINT 			                                            ;//�ڴ˲��ܿ��ж�
    LDR     SP, =StackUsr
   
    MSR     CPSR_c, #SVCMODE| NOINT				                                                   ;//���ж�
    MOV     PC, R0  
    
    LTORG  

;/************************************ �л���ϵͳģʽ�������ж� ********************************************/
            
    EXPORT  StartInterrupt
StartInterrupt    
    MSR     CPSR_c, #SVCMODE 
    MOV  	PC, LR

;/*
;************************************************************************************************************
;**                                          �ú����������ģʽ                                            **
;************************************************************************************************************
;*/
;//void EnterPWDN(int CLKCON);

EnterPWDN
    mov	    r2,r0               													             ;//r0=CLKCON
    ldr	    r0,=REFRESH		
    ldr	    r3,[r0]
    mov	    r1, r3
    orr	    r1, r1, #0x400000   				                                                ;//���Ը���
    str	    r1, [r0]

    nop     					   				                             ;//�ȴ�ֱ���Ը��¿�ʼ. Ҳ����Ҫ��
    nop     					
    nop	    					
    nop
    nop
    nop
    nop
	
	;//���� POWERDN ģʽ
    ldr	    r0,=CLKCON
    str	    r2,[r0]
	
	;//�ȴ���ֱ������SL_IDLE,STOP ģʽ��ֱ������
    mov	    r0,#0xff
0   subs    r0,r0,#1
    bne	    %B0
	
	;//��DRAM/SDRAM �Ը���ģʽ���˳���
    ldr	    r0,=REFRESH
    str	    r3,[r0]
    mov	    pc,lr

    LTORG

;/*
;************************************************************************************************************
;** 				                       �洢������Ӧ�Ż����������ܷ���                                  **
;************************************************************************************************************

;*** �洢���������ڲ������趨���� ***
	; 1) Even FP-DRAM, EDO setting has more late fetch point by half-clock
	; 2) FP-DRAM Parameters:tRCD=3 for tRAC, tcas=2 for pad delay, tcp=2 for bus load.
	; 3) DRAM refresh rate is for 40Mhz. 
	; 4) The memory settings,here, are made the safe parameters even at 66Mhz.
;*/
SMRDATA DATA
;//bank0	16bit BOOT ROM SST39VF160/SST39VF320
;//bank1	16bit USB1.1 PDIUSBD12
;//bank2	8bit Nand Flash K9F2808U0A/K9F5608U0A
;//bank3	RTL8019
;//bank4	No Uesed
;//bank5	No Uesed
;//bank6	16bit SDRAM
;//bank7	16bit SDRAM
    [ BUSWIDTH=16
		DCD  0x11001002	 ; //Bank0   =  16bit BootFlash SST39VF160/SST39VF320) 
;//            ||||||||-	 Bank1   =  8bit PDIUSBD12
;//            ||||||---	 Bank2   =  8bit Nand Flash
;//            |||||----	 Bank3   =  16bit RTL8019
;//            ||||-----	 Bank4~5 =  8bit No Uesd
;//            ||--------	 Bank6~7 =  16bit SDRAM
    | 					;//BUSWIDTH=32
		DCD 0x22222220	;Bank0=OM[1:0], Bank1~Bank7=32bit
    ]
	DCD ((B0_Tacs<<13)+(B0_Tcos<<11)+(B0_Tacc<<8)+(B0_Tcoh<<6)+(B0_Tah<<4)+(B0_Tacp<<2)+(B0_PMC))	;//GCS0
	DCD ((B1_Tacs<<13)+(B1_Tcos<<11)+(B1_Tacc<<8)+(B1_Tcoh<<6)+(B1_Tah<<4)+(B1_Tacp<<2)+(B1_PMC))	;//GCS1 
	DCD ((B2_Tacs<<13)+(B2_Tcos<<11)+(B2_Tacc<<8)+(B2_Tcoh<<6)+(B2_Tah<<4)+(B2_Tacp<<2)+(B2_PMC))	;//GCS2
	DCD ((B3_Tacs<<13)+(B3_Tcos<<11)+(B3_Tacc<<8)+(B3_Tcoh<<6)+(B3_Tah<<4)+(B3_Tacp<<2)+(B3_PMC))	;//GCS3
	DCD ((B4_Tacs<<13)+(B4_Tcos<<11)+(B4_Tacc<<8)+(B4_Tcoh<<6)+(B4_Tah<<4)+(B4_Tacp<<2)+(B4_PMC))	;//GCS4
	DCD ((B5_Tacs<<13)+(B5_Tcos<<11)+(B5_Tacc<<8)+(B5_Tcoh<<6)+(B5_Tah<<4)+(B5_Tacp<<2)+(B5_PMC))	;//GCS5
	[ BDRAMTYPE="DRAM" 
	    DCD ((B6_MT<<15)+(B6_Trcd<<4)+(B6_Tcas<<3)+(B6_Tcp<<2)+(B6_CAN))	;//GCS6 check the MT value in parameter.a
	    DCD ((B7_MT<<15)+(B7_Trcd<<4)+(B7_Tcas<<3)+(B7_Tcp<<2)+(B7_CAN))	;//GCS7
	| 																		;//"SDRAM"
		DCD ((B6_MT<<15)+(B6_Trcd<<2)+(B6_SCAN))							;//GCS6
		DCD ((B7_MT<<15)+(B7_Trcd<<2)+(B7_SCAN))							;//GCS7
	]
	DCD ((REFEN<<23)+(TREFMD<<22)+(Trp<<20)+(Trc<<18)+(Tchr<<16)+REFCNT)	;//REFRESH RFEN=1, TREFMD=0, trp=3clk, trc=5clk, tchr=3clk,count=1113
	DCD 0x10			;//SCLK power down mode, BANKSIZE 32M/32M
	DCD 0x20			;//MRSR6 CL=2clk
	DCD 0x20			;//MRSR7

	ALIGN
;/*
;************************************************************************************************************
;** 				                     �����������ģʽ�Ķ�ջ�ռ�                                        **
;************************************************************************************************************
*/
	
	AREA RamData, DATA, READWRITE

	^	(_ISR_STARTADDRESS-0x500)
				
StackUsr	#	256				                                                               ;//0x0C7ffa00
StackSvc	#	256				                                                               ;//0x0C7ffb00
StackUnd	#	256				                                                               ;//0x0C7ffc00
StackAbt	#	256				                                                               ;//0x0C7ffd00
StackIrq	#	256				                                                               ;//0x0C7ffe00
StackFiq	#	0				                                                               ;//0x0C7fff00

;/*
;************************************************************************************************************
;** 				                       ������ȷ������ж������ĵ�ַ                                    **
;************************************************************************************************************
*/
	
	^	_ISR_STARTADDRESS
HandleReset		#	4
HandleUndef		#	4
HandleSWI		#	4
HandlePabort	#	4
HandleDabort	#	4
HandleReserved	#	4
HandleIRQ		#	4
HandleFIQ		#	4


HandleADC		#	4
HandleRTC		#	4
HandleUTXD1		#	4
HandleUTXD0		#	4
HandleSIO		#	4
HandleIIC		#	4
HandleURXD1		#	4
HandleURXD0		#	4
HandleTIMER5	#	4
HandleTIMER4	#	4
HandleTIMER3	#	4
HandleTIMER2	#	4
HandleTIMER1	#	4
HandleTIMER0	#	4
HandleUERR01	#	4
HandleWDT		#	4
HandleBDMA1		#	4
HandleBDMA0		#	4
HandleZDMA1		#	4
HandleZDMA0		#	4
HandleTICK		#	4
HandleEINT4567	#	4
HandleEINT3		#	4
HandleEINT2		#	4
HandleEINT1		#	4
HandleEINT0		#	4   	                                                                  ; //0x0c7fff84

;/*
;************************************************************************************************************
;*-                            				�����ļ�													   -*
;************************************************************************************************************
;*/
		END
