;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.3 #11345 (Linux)
;--------------------------------------------------------
	.file "main"
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.global _main
	.global _milis
	.global _init_milis
	.global _TIM2_SetCompare3
	.global _TIM2_SetCompare2
	.global _TIM2_SetCompare1
	.global _TIM2_OC3PreloadConfig
	.global _TIM2_OC2PreloadConfig
	.global _TIM2_OC1PreloadConfig
	.global _TIM2_Cmd
	.global _TIM2_OC3Init
	.global _TIM2_OC2Init
	.global _TIM2_OC1Init
	.global _TIM2_TimeBaseInit
	.global _GPIO_ReadInputPin
	.global _GPIO_WriteLow
	.global _GPIO_WriteHigh
	.global _GPIO_Init
	.global _CLK_HSIPrescalerConfig
	.global _init
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.section .vectors,	"ax"
__interrupt_vect:
	int _start ; reset
	int _TRAP_IRQHandler ; trap
	int _TLI_IRQHandler ; int0
	int _AWU_IRQHandler ; int1
	int _CLK_IRQHandler ; int2
	int _EXTI_PORTA_IRQHandler ; int3
	int _EXTI_PORTB_IRQHandler ; int4
	int _EXTI_PORTC_IRQHandler ; int5
	int _EXTI_PORTD_IRQHandler ; int6
	int _EXTI_PORTE_IRQHandler ; int7
	int _CAN_RX_IRQHandler ; int8
	int _CAN_TX_IRQHandler ; int9
	int _SPI_IRQHandler ; int10
	int _TIM1_UPD_OVF_TRG_BRK_IRQHandler ; int11
	int _TIM1_CAP_COM_IRQHandler ; int12
	int _TIM2_UPD_OVF_BRK_IRQHandler ; int13
	int _TIM2_CAP_COM_IRQHandler ; int14
	int _TIM3_UPD_OVF_BRK_IRQHandler ; int15
	int _TIM3_CAP_COM_IRQHandler ; int16
	int _UART1_TX_IRQHandler ; int17
	int _UART1_RX_IRQHandler ; int18
	int _I2C_IRQHandler ; int19
	int _UART3_TX_IRQHandler ; int20
	int _UART3_RX_IRQHandler ; int21
	int _ADC2_IRQHandler ; int22
	int _TIM4_UPD_OVF_IRQHandler ; int23
	int _EEPROM_EEC_IRQHandler ; int24
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.section .text
	.global _start
_start:
	; Check if there is at least one byte allocated on .bss
	ldw x, #__bss_start
	cpw x, #__bss_end
	jreq 1$
0$:
	; Zeroing .bss
	clr (x)
	incw x
	cpw x, #__bss_end
	jrne 0$
1$:
	; Check if there is at least one byte allocated on .data
	ldw y, #__data_start
	cpw y, #_edata
	jreq 3$
	; Transfer .data from ROM to RAM
	ldw x, #__data_load_start
2$:
	ld a, (x)
	ld (y), a
	incw x
	incw y
	cpw y, #_edata
	jrne 2$
3$:
__sdcc_program_startup:
	jp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.section .text
	.section	 .text._init
	.Lmain_init_0:
;	./src/main.c: 9: void init(void) {
; genLabel
;	-----------------------------------------
;	 function init
;	-----------------------------------------
;	Register assignment is optimal.
;	Stack space usage: 0 bytes.
_init:
	.Lmain_init_1:
	.Lmain_init_2:
;	./src/main.c: 10: CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1); // taktovani MCU na 16MHz
; genIPush
	push	#0x00
	.Lmain_init_3:
; genCall
	call	_CLK_HSIPrescalerConfig
	pop	a
	.Lmain_init_4:
	.Lmain_init_5:
;	./src/main.c: 12: init_milis();
; genCall
	call	_init_milis
	.Lmain_init_6:
;	./src/main.c: 14: GPIO_Init(PWM_R_PORT, PWM_R_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_7:
; genIPush
	push	#0x08
	.Lmain_init_8:
; genIPush
	push	#0x00
	.Lmain_init_9:
	push	#0x50
	.Lmain_init_10:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_11:
	.Lmain_init_12:
;	./src/main.c: 15: GPIO_Init(PWM_G_PORT, PWM_G_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_13:
; genIPush
	push	#0x08
	.Lmain_init_14:
; genIPush
	push	#0x0f
	.Lmain_init_15:
	push	#0x50
	.Lmain_init_16:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_17:
	.Lmain_init_18:
;	./src/main.c: 16: GPIO_Init(PWM_B_PORT, PWM_B_PIN, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_19:
; genIPush
	push	#0x10
	.Lmain_init_20:
; genIPush
	push	#0x0f
	.Lmain_init_21:
	push	#0x50
	.Lmain_init_22:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_23:
	.Lmain_init_24:
;	./src/main.c: 18: GPIO_Init(GPIOG, GPIO_PIN_6, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_25:
; genIPush
	push	#0x40
	.Lmain_init_26:
; genIPush
	push	#0x1e
	.Lmain_init_27:
	push	#0x50
	.Lmain_init_28:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_29:
	.Lmain_init_30:
;	./src/main.c: 19: GPIO_Init(GPIOG, GPIO_PIN_7, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_31:
; genIPush
	push	#0x80
	.Lmain_init_32:
; genIPush
	push	#0x1e
	.Lmain_init_33:
	push	#0x50
	.Lmain_init_34:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_35:
	.Lmain_init_36:
;	./src/main.c: 20: GPIO_Init(GPIOG, GPIO_PIN_4, GPIO_MODE_OUT_PP_LOW_SLOW);
; genIPush
	push	#0xc0
	.Lmain_init_37:
; genIPush
	push	#0x10
	.Lmain_init_38:
; genIPush
	push	#0x1e
	.Lmain_init_39:
	push	#0x50
	.Lmain_init_40:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_41:
	.Lmain_init_42:
;	./src/main.c: 22: GPIO_Init(S1_PORT, S1_PIN, GPIO_MODE_IN_PU_NO_IT);
; genIPush
	push	#0x40
	.Lmain_init_43:
; genIPush
	push	#0x04
	.Lmain_init_44:
; genIPush
	push	#0x05
	.Lmain_init_45:
	push	#0x50
	.Lmain_init_46:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_47:
	.Lmain_init_48:
;	./src/main.c: 23: GPIO_Init(S2_PORT, S2_PIN, GPIO_MODE_IN_PU_NO_IT);
; genIPush
	push	#0x40
	.Lmain_init_49:
; genIPush
	push	#0x08
	.Lmain_init_50:
; genIPush
	push	#0x05
	.Lmain_init_51:
	push	#0x50
	.Lmain_init_52:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_53:
	.Lmain_init_54:
;	./src/main.c: 24: GPIO_Init(S3_PORT, S3_PIN, GPIO_MODE_IN_PU_NO_IT);
; genIPush
	push	#0x40
	.Lmain_init_55:
; genIPush
	push	#0x10
	.Lmain_init_56:
; genIPush
	push	#0x05
	.Lmain_init_57:
	push	#0x50
	.Lmain_init_58:
; genCall
	call	_GPIO_Init
	addw	sp, #4
	.Lmain_init_59:
	.Lmain_init_60:
;	./src/main.c: 26: TIM2_TimeBaseInit(TIM2_PRESCALER_16, 10000 - 1);
; genIPush
	push	#0x0f
	.Lmain_init_61:
	push	#0x27
	.Lmain_init_62:
; genIPush
	push	#0x04
	.Lmain_init_63:
; genCall
	call	_TIM2_TimeBaseInit
	addw	sp, #3
	.Lmain_init_64:
	.Lmain_init_65:
;	./src/main.c: 28: TIM2_OC1Init(TIM2_OCMODE_PWM1,        // inicializujmee kanaál 1 (TIM2_CH1)
; genIPush
	push	#0x00
	.Lmain_init_66:
; genIPush
	clrw	x
	pushw	x
	.Lmain_init_67:
; genIPush
	push	#0x11
	.Lmain_init_68:
; genIPush
	push	#0x60
	.Lmain_init_69:
; genCall
	call	_TIM2_OC1Init
	addw	sp, #5
	.Lmain_init_70:
	.Lmain_init_71:
;	./src/main.c: 32: TIM2_OC2Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0,
; genIPush
	push	#0x00
	.Lmain_init_72:
; genIPush
	clrw	x
	pushw	x
	.Lmain_init_73:
; genIPush
	push	#0x11
	.Lmain_init_74:
; genIPush
	push	#0x60
	.Lmain_init_75:
; genCall
	call	_TIM2_OC2Init
	addw	sp, #5
	.Lmain_init_76:
	.Lmain_init_77:
;	./src/main.c: 34: TIM2_OC3Init(TIM2_OCMODE_PWM1, TIM2_OUTPUTSTATE_ENABLE, 0,
; genIPush
	push	#0x00
	.Lmain_init_78:
; genIPush
	clrw	x
	pushw	x
	.Lmain_init_79:
; genIPush
	push	#0x11
	.Lmain_init_80:
; genIPush
	push	#0x60
	.Lmain_init_81:
; genCall
	call	_TIM2_OC3Init
	addw	sp, #5
	.Lmain_init_82:
	.Lmain_init_83:
;	./src/main.c: 37: TIM2_OC1PreloadConfig(ENABLE);
; genIPush
	push	#0x01
	.Lmain_init_84:
; genCall
	call	_TIM2_OC1PreloadConfig
	pop	a
	.Lmain_init_85:
	.Lmain_init_86:
;	./src/main.c: 38: TIM2_OC2PreloadConfig(ENABLE);
; genIPush
	push	#0x01
	.Lmain_init_87:
; genCall
	call	_TIM2_OC2PreloadConfig
	pop	a
	.Lmain_init_88:
	.Lmain_init_89:
;	./src/main.c: 39: TIM2_OC3PreloadConfig(ENABLE);
; genIPush
	push	#0x01
	.Lmain_init_90:
; genCall
	call	_TIM2_OC3PreloadConfig
	pop	a
	.Lmain_init_91:
	.Lmain_init_92:
;	./src/main.c: 41: TIM2_Cmd(ENABLE); // povolí TIM2
; genIPush
	push	#0x01
	.Lmain_init_93:
; genCall
	call	_TIM2_Cmd
	pop	a
	.Lmain_init_94:
; genLabel
00101$:
	.Lmain_init_95:
;	./src/main.c: 42: }
; genEndFunction
	.Lmain_init_96:
	.Lmain_initendf:
	ret
	.Lmain_init_97:
	.section	 .text._main
	.Lmain_main_98:
;	./src/main.c: 44: int main(void) {
; genLabel
;	-----------------------------------------
;	 function main
;	-----------------------------------------
;	Register assignment might be sub-optimal.
;	Stack space usage: 20 bytes.
_main:
	.Lmain_main_99:
	sub	sp, #20
	.Lmain_main_100:
	.Lmain_main_101:
;	./src/main.c: 45: uint8_t mod = 1;
; genAssign
	ld	a, #0x01
	ld	(0x01, sp), a
	.Lmain_main_102:
;	./src/main.c: 46: uint32_t time = 0;
; genAssign
	clrw	x
	ldw	(0x04, sp), x
	ldw	(0x02, sp), x
	.Lmain_main_103:
;	./src/main.c: 47: uint16_t r = 0, g = 0, b = 0;
; genAssign
	clrw	x
	ldw	(0x06, sp), x
; genAssign
	clrw	x
	ldw	(0x08, sp), x
; genAssign
	clrw	x
	ldw	(0x0a, sp), x
	.Lmain_main_104:
;	./src/main.c: 48: uint8_t s_mem = 0;
; genAssign
	clr	(0x0c, sp)
	.Lmain_main_105:
;	./src/main.c: 49: init();
; genCall
	call	_init
	.Lmain_main_106:
;	./src/main.c: 51: while (1) {
; genLabel
00141$:
	.Lmain_main_107:
	.Lmain_main_108:
;	./src/main.c: 53: if (milis() - time > 10) {
; genCall
	call	_milis
	ldw	(0x0f, sp), x
	ldw	(0x0d, sp), y
; genMinus
	ldw	x, (0x0f, sp)
	subw	x, (0x04, sp)
	ldw	(0x13, sp), x
	ld	a, (0x0e, sp)
	sbc	a, (0x03, sp)
	ld	(0x12, sp), a
	ld	a, (0x0d, sp)
	sbc	a, (0x02, sp)
	ld	(0x11, sp), a
; genCmp
; genCmpTop
	ldw	x, #0x000a
	cpw	x, (0x13, sp)
	clr	a
	sbc	a, (0x12, sp)
	clr	a
	sbc	a, (0x11, sp)
	jrc	00245$
	jp	00141$
00245$:
; skipping generated iCode
	.Lmain_main_109:
	.Lmain_main_110:
;	./src/main.c: 54: time = milis();
; genCall
	call	_milis
; genAssign
	ldw	(0x04, sp), x
	ldw	(0x02, sp), y
	.Lmain_main_111:
;	./src/main.c: 56: if (PUSH(S1)) {
; genIPush
	push	#0x04
	.Lmain_main_112:
; genIPush
	push	#0x05
	.Lmain_main_113:
	push	#0x50
	.Lmain_main_114:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_115:
; genIfx
	tnz	a
	jreq	00246$
	jp	00106$
00246$:
	.Lmain_main_116:
	.Lmain_main_117:
;	./src/main.c: 57: if (s_mem == 0) { // provedu akci
; genIfx
	tnz	(0x0c, sp)
	jreq	00247$
	jp	00104$
00247$:
	.Lmain_main_118:
	.Lmain_main_119:
;	./src/main.c: 58: mod += 1;
; genCast
; genAssign
	ld	a, (0x01, sp)
; genPlus
	inc	a
	ld	(0x01, sp), a
	.Lmain_main_120:
;	./src/main.c: 59: if (mod > 3) {
; genCmp
; genCmpTop
	ld	a, (0x01, sp)
	cp	a, #0x03
	jrugt	00248$
	jp	00104$
00248$:
; skipping generated iCode
	.Lmain_main_121:
	.Lmain_main_122:
;	./src/main.c: 60: mod = 1;
; genAssign
	ld	a, #0x01
	ld	(0x01, sp), a
	.Lmain_main_123:
; genLabel
00104$:
	.Lmain_main_124:
;	./src/main.c: 63: s_mem = 1;
; genAssign
	ld	a, #0x01
	ld	(0x0c, sp), a
	.Lmain_main_125:
; genGoto
	jp	00107$
; genLabel
00106$:
	.Lmain_main_126:
;	./src/main.c: 65: s_mem = 0;
; genAssign
	clr	(0x0c, sp)
; genLabel
00107$:
	.Lmain_main_127:
;	./src/main.c: 66: if (mod == 1) {
; genCmpEQorNE
	ld	a, (0x01, sp)
	dec	a
	jrne	00250$
	jp	00251$
00250$:
	jp	00117$
00251$:
	.Lmain_main_128:
; skipping generated iCode
	.Lmain_main_129:
	.Lmain_main_130:
;	./src/main.c: 67: GPIO_WriteHigh(GPIOG, GPIO_PIN_6);
; genIPush
	push	#0x40
	.Lmain_main_131:
; genIPush
	push	#0x1e
	.Lmain_main_132:
	push	#0x50
	.Lmain_main_133:
; genCall
	call	_GPIO_WriteHigh
	addw	sp, #3
	.Lmain_main_134:
	.Lmain_main_135:
;	./src/main.c: 68: GPIO_WriteLow(GPIOG, GPIO_PIN_7);
; genIPush
	push	#0x80
	.Lmain_main_136:
; genIPush
	push	#0x1e
	.Lmain_main_137:
	push	#0x50
	.Lmain_main_138:
; genCall
	call	_GPIO_WriteLow
	addw	sp, #3
	.Lmain_main_139:
	.Lmain_main_140:
;	./src/main.c: 69: if (PUSH(S2)) {
; genIPush
	push	#0x08
	.Lmain_main_141:
; genIPush
	push	#0x05
	.Lmain_main_142:
	push	#0x50
	.Lmain_main_143:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_144:
; genIfx
	tnz	a
	jreq	00252$
	jp	00111$
00252$:
	.Lmain_main_145:
	.Lmain_main_146:
;	./src/main.c: 70: r += 50;
; genPlus
	ldw	x, (0x06, sp)
	addw	x, #0x0032
; genAssign
	ldw	(0x06, sp), x
	.Lmain_main_147:
;	./src/main.c: 71: if (r > 10000)
; genCmp
; genCmpTop
	ldw	x, (0x06, sp)
	cpw	x, #0x2710
	jrugt	00253$
	jp	00109$
00253$:
; skipping generated iCode
	.Lmain_main_148:
;	./src/main.c: 72: r = 0;
; genAssign
	clrw	x
	ldw	(0x06, sp), x
; genLabel
00109$:
	.Lmain_main_149:
;	./src/main.c: 73: TIM2_SetCompare1(r);
; genIPush
	ldw	x, (0x06, sp)
	pushw	x
	.Lmain_main_150:
; genCall
	call	_TIM2_SetCompare1
	popw	x
	.Lmain_main_151:
	.Lmain_main_152:
; genLabel
00111$:
	.Lmain_main_153:
;	./src/main.c: 75: if (PUSH(S3)) {
; genIPush
	push	#0x10
	.Lmain_main_154:
; genIPush
	push	#0x05
	.Lmain_main_155:
	push	#0x50
	.Lmain_main_156:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_157:
; genIfx
	tnz	a
	jreq	00254$
	jp	00117$
00254$:
	.Lmain_main_158:
	.Lmain_main_159:
;	./src/main.c: 76: if (r >= 50)
; genCmp
; genCmpTop
	ldw	x, (0x06, sp)
	cpw	x, #0x0032
	jrnc	00255$
	jp	00113$
00255$:
; skipping generated iCode
	.Lmain_main_160:
;	./src/main.c: 77: r -= 50;
; genMinus
	ldw	x, (0x06, sp)
	subw	x, #0x0032
; genAssign
	ldw	(0x06, sp), x
; genLabel
00113$:
	.Lmain_main_161:
;	./src/main.c: 78: TIM2_SetCompare1(r);
; genIPush
	ldw	x, (0x06, sp)
	pushw	x
	.Lmain_main_162:
; genCall
	call	_TIM2_SetCompare1
	popw	x
	.Lmain_main_163:
	.Lmain_main_164:
; genLabel
00117$:
	.Lmain_main_165:
;	./src/main.c: 81: if (mod == 2) {
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0x02
	jrne	00257$
	jp	00258$
00257$:
	jp	00127$
00258$:
	.Lmain_main_166:
; skipping generated iCode
	.Lmain_main_167:
	.Lmain_main_168:
;	./src/main.c: 82: GPIO_WriteHigh(GPIOG, GPIO_PIN_4);
; genIPush
	push	#0x10
	.Lmain_main_169:
; genIPush
	push	#0x1e
	.Lmain_main_170:
	push	#0x50
	.Lmain_main_171:
; genCall
	call	_GPIO_WriteHigh
	addw	sp, #3
	.Lmain_main_172:
	.Lmain_main_173:
;	./src/main.c: 83: GPIO_WriteLow(GPIOG, GPIO_PIN_6);
; genIPush
	push	#0x40
	.Lmain_main_174:
; genIPush
	push	#0x1e
	.Lmain_main_175:
	push	#0x50
	.Lmain_main_176:
; genCall
	call	_GPIO_WriteLow
	addw	sp, #3
	.Lmain_main_177:
	.Lmain_main_178:
;	./src/main.c: 84: if (PUSH(S2)) {
; genIPush
	push	#0x08
	.Lmain_main_179:
; genIPush
	push	#0x05
	.Lmain_main_180:
	push	#0x50
	.Lmain_main_181:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_182:
; genIfx
	tnz	a
	jreq	00259$
	jp	00121$
00259$:
	.Lmain_main_183:
	.Lmain_main_184:
;	./src/main.c: 85: g += 50;
; genPlus
	ldw	x, (0x08, sp)
	addw	x, #0x0032
; genAssign
	ldw	(0x08, sp), x
	.Lmain_main_185:
;	./src/main.c: 86: if (g > 10000)
; genCmp
; genCmpTop
	ldw	x, (0x08, sp)
	cpw	x, #0x2710
	jrugt	00260$
	jp	00119$
00260$:
; skipping generated iCode
	.Lmain_main_186:
;	./src/main.c: 87: g = 0;
; genAssign
	clrw	x
	ldw	(0x08, sp), x
; genLabel
00119$:
	.Lmain_main_187:
;	./src/main.c: 88: TIM2_SetCompare2(g);
; genIPush
	ldw	x, (0x08, sp)
	pushw	x
	.Lmain_main_188:
; genCall
	call	_TIM2_SetCompare2
	popw	x
	.Lmain_main_189:
	.Lmain_main_190:
; genLabel
00121$:
	.Lmain_main_191:
;	./src/main.c: 90: if (PUSH(S3)) {
; genIPush
	push	#0x10
	.Lmain_main_192:
; genIPush
	push	#0x05
	.Lmain_main_193:
	push	#0x50
	.Lmain_main_194:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_195:
; genIfx
	tnz	a
	jreq	00261$
	jp	00127$
00261$:
	.Lmain_main_196:
	.Lmain_main_197:
;	./src/main.c: 91: if (g >= 50)
; genCmp
; genCmpTop
	ldw	x, (0x08, sp)
	cpw	x, #0x0032
	jrnc	00262$
	jp	00123$
00262$:
; skipping generated iCode
	.Lmain_main_198:
;	./src/main.c: 92: g -= 50;
; genMinus
	ldw	x, (0x08, sp)
	subw	x, #0x0032
; genAssign
	ldw	(0x08, sp), x
; genLabel
00123$:
	.Lmain_main_199:
;	./src/main.c: 93: TIM2_SetCompare2(g);
; genIPush
	ldw	x, (0x08, sp)
	pushw	x
	.Lmain_main_200:
; genCall
	call	_TIM2_SetCompare2
	popw	x
	.Lmain_main_201:
	.Lmain_main_202:
; genLabel
00127$:
	.Lmain_main_203:
;	./src/main.c: 96: if (mod == 3) {
; genCmpEQorNE
	ld	a, (0x01, sp)
	cp	a, #0x03
	jrne	00264$
	jp	00265$
00264$:
	jp	00141$
00265$:
	.Lmain_main_204:
; skipping generated iCode
	.Lmain_main_205:
	.Lmain_main_206:
;	./src/main.c: 97: GPIO_WriteHigh(GPIOG, GPIO_PIN_7);
; genIPush
	push	#0x80
	.Lmain_main_207:
; genIPush
	push	#0x1e
	.Lmain_main_208:
	push	#0x50
	.Lmain_main_209:
; genCall
	call	_GPIO_WriteHigh
	addw	sp, #3
	.Lmain_main_210:
	.Lmain_main_211:
;	./src/main.c: 98: GPIO_WriteLow(GPIOG, GPIO_PIN_4);
; genIPush
	push	#0x10
	.Lmain_main_212:
; genIPush
	push	#0x1e
	.Lmain_main_213:
	push	#0x50
	.Lmain_main_214:
; genCall
	call	_GPIO_WriteLow
	addw	sp, #3
	.Lmain_main_215:
	.Lmain_main_216:
;	./src/main.c: 99: if (PUSH(S2)) {
; genIPush
	push	#0x08
	.Lmain_main_217:
; genIPush
	push	#0x05
	.Lmain_main_218:
	push	#0x50
	.Lmain_main_219:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_220:
; genIfx
	tnz	a
	jreq	00266$
	jp	00131$
00266$:
	.Lmain_main_221:
	.Lmain_main_222:
;	./src/main.c: 100: b += 500;
; genPlus
	ldw	x, (0x0a, sp)
	addw	x, #0x01f4
; genAssign
	ldw	(0x0a, sp), x
	.Lmain_main_223:
;	./src/main.c: 101: if (b > 10000)
; genCmp
; genCmpTop
	ldw	x, (0x0a, sp)
	cpw	x, #0x2710
	jrugt	00267$
	jp	00129$
00267$:
; skipping generated iCode
	.Lmain_main_224:
;	./src/main.c: 102: b = 0;
; genAssign
	clrw	x
	ldw	(0x0a, sp), x
; genLabel
00129$:
	.Lmain_main_225:
;	./src/main.c: 103: TIM2_SetCompare3(b);
; genIPush
	ldw	x, (0x0a, sp)
	pushw	x
	.Lmain_main_226:
; genCall
	call	_TIM2_SetCompare3
	popw	x
	.Lmain_main_227:
	.Lmain_main_228:
; genLabel
00131$:
	.Lmain_main_229:
;	./src/main.c: 105: if (PUSH(S3)) {
; genIPush
	push	#0x10
	.Lmain_main_230:
; genIPush
	push	#0x05
	.Lmain_main_231:
	push	#0x50
	.Lmain_main_232:
; genCall
	call	_GPIO_ReadInputPin
	addw	sp, #3
	.Lmain_main_233:
; genIfx
	tnz	a
	jreq	00268$
	jp	00141$
00268$:
	.Lmain_main_234:
	.Lmain_main_235:
;	./src/main.c: 106: if (b >= 50)
; genCmp
; genCmpTop
	ldw	x, (0x0a, sp)
	cpw	x, #0x0032
	jrnc	00269$
	jp	00133$
00269$:
; skipping generated iCode
	.Lmain_main_236:
;	./src/main.c: 107: b -= 50;
; genMinus
	ldw	x, (0x0a, sp)
	subw	x, #0x0032
; genAssign
	ldw	(0x0a, sp), x
; genLabel
00133$:
	.Lmain_main_237:
;	./src/main.c: 108: TIM2_SetCompare3(b);
; genIPush
	ldw	x, (0x0a, sp)
	pushw	x
	.Lmain_main_238:
; genCall
	call	_TIM2_SetCompare3
	popw	x
	.Lmain_main_239:
	.Lmain_main_240:
; genGoto
	jp	00141$
; genLabel
00143$:
	.Lmain_main_241:
;	./src/main.c: 113: }
; genEndFunction
	addw	sp, #20
	.Lmain_main_242:
	.Lmain_main_243:
	.Lmain_mainendf:
	ret
	.Lmain_main_244:
	.section .text
	.section .text.rodata
	.section .data
	.section CABS (ABS)

	.section .debug_line, ""
	.word	0,.Ldebug_line_end-.Ldebug_line_start
.Ldebug_line_start:
	.word	2
	.word	0,.Ldebug_line_stmt-6-.Ldebug_line_start
	.byte	1
	.byte	1
	.byte	-5
	.byte	15
	.byte	10
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.ascii "/usr/local/stow/sdcc-gas/bin/../share/sdcc/include/stm8"
	.byte	0
	.ascii "/usr/local/stow/sdcc-gas/share/sdcc/include/stm8"
	.byte	0
	.ascii "/usr/local/stow/sdcc-gas/bin/../share/sdcc/include"
	.byte	0
	.ascii "/usr/local/stow/sdcc-gas/share/sdcc/include"
	.byte	0
	.byte	0
	.ascii "./src/main.c"
	.byte	0
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
.Ldebug_line_stmt:
	.byte	0
	.uleb128	5
	.byte	2
	.word	0,(.Lmain_init_0)
	.byte	3
	.sleb128	8
	.byte	1
	.byte	9
	.word	.Lmain_init_2-.Lmain_init_0
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_5-.Lmain_init_2
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_6-.Lmain_init_5
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_12-.Lmain_init_6
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_18-.Lmain_init_12
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_24-.Lmain_init_18
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_30-.Lmain_init_24
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_36-.Lmain_init_30
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_42-.Lmain_init_36
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_48-.Lmain_init_42
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_54-.Lmain_init_48
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_60-.Lmain_init_54
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_65-.Lmain_init_60
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_71-.Lmain_init_65
	.byte	3
	.sleb128	4
	.byte	1
	.byte	9
	.word	.Lmain_init_77-.Lmain_init_71
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_83-.Lmain_init_77
	.byte	3
	.sleb128	3
	.byte	1
	.byte	9
	.word	.Lmain_init_86-.Lmain_init_83
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_89-.Lmain_init_86
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_init_92-.Lmain_init_89
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_init_95-.Lmain_init_92
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	1+.Lmain_init_96-.Lmain_init_95
	.byte	0
	.uleb128	1
	.byte	1
	.byte	0
	.uleb128	5
	.byte	2
	.word	0,(.Lmain_main_98)
	.byte	3
	.sleb128	43
	.byte	1
	.byte	9
	.word	.Lmain_main_101-.Lmain_main_98
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_102-.Lmain_main_101
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_103-.Lmain_main_102
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_104-.Lmain_main_103
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_105-.Lmain_main_104
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_106-.Lmain_main_105
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_108-.Lmain_main_106
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_110-.Lmain_main_108
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_111-.Lmain_main_110
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_117-.Lmain_main_111
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_119-.Lmain_main_117
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_120-.Lmain_main_119
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_122-.Lmain_main_120
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_124-.Lmain_main_122
	.byte	3
	.sleb128	3
	.byte	1
	.byte	9
	.word	.Lmain_main_126-.Lmain_main_124
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_127-.Lmain_main_126
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_130-.Lmain_main_127
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_135-.Lmain_main_130
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_140-.Lmain_main_135
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_146-.Lmain_main_140
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_147-.Lmain_main_146
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_148-.Lmain_main_147
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_149-.Lmain_main_148
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_153-.Lmain_main_149
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_159-.Lmain_main_153
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_160-.Lmain_main_159
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_161-.Lmain_main_160
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_165-.Lmain_main_161
	.byte	3
	.sleb128	3
	.byte	1
	.byte	9
	.word	.Lmain_main_168-.Lmain_main_165
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_173-.Lmain_main_168
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_178-.Lmain_main_173
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_184-.Lmain_main_178
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_185-.Lmain_main_184
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_186-.Lmain_main_185
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_187-.Lmain_main_186
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_191-.Lmain_main_187
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_197-.Lmain_main_191
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_198-.Lmain_main_197
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_199-.Lmain_main_198
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_203-.Lmain_main_199
	.byte	3
	.sleb128	3
	.byte	1
	.byte	9
	.word	.Lmain_main_206-.Lmain_main_203
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_211-.Lmain_main_206
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_216-.Lmain_main_211
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_222-.Lmain_main_216
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_223-.Lmain_main_222
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_224-.Lmain_main_223
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_225-.Lmain_main_224
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_229-.Lmain_main_225
	.byte	3
	.sleb128	2
	.byte	1
	.byte	9
	.word	.Lmain_main_235-.Lmain_main_229
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_236-.Lmain_main_235
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_237-.Lmain_main_236
	.byte	3
	.sleb128	1
	.byte	1
	.byte	9
	.word	.Lmain_main_241-.Lmain_main_237
	.byte	3
	.sleb128	5
	.byte	1
	.byte	9
	.word	1+.Lmain_main_243-.Lmain_main_241
	.byte	0
	.uleb128	1
	.byte	1
.Ldebug_line_end:

	.section .debug_loc, ""
.Ldebug_loc_start:
	.word	0,(.Lmain_main_242)
	.word	0,(.Lmain_main_244)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_main_239)
	.word	0,(.Lmain_main_242)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_238)
	.word	0,(.Lmain_main_239)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_233)
	.word	0,(.Lmain_main_238)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_232)
	.word	0,(.Lmain_main_233)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_231)
	.word	0,(.Lmain_main_232)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_230)
	.word	0,(.Lmain_main_231)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_227)
	.word	0,(.Lmain_main_230)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_226)
	.word	0,(.Lmain_main_227)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_220)
	.word	0,(.Lmain_main_226)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_219)
	.word	0,(.Lmain_main_220)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_218)
	.word	0,(.Lmain_main_219)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_217)
	.word	0,(.Lmain_main_218)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_215)
	.word	0,(.Lmain_main_217)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_214)
	.word	0,(.Lmain_main_215)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_213)
	.word	0,(.Lmain_main_214)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_212)
	.word	0,(.Lmain_main_213)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_210)
	.word	0,(.Lmain_main_212)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_209)
	.word	0,(.Lmain_main_210)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_208)
	.word	0,(.Lmain_main_209)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_207)
	.word	0,(.Lmain_main_208)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_204)
	.word	0,(.Lmain_main_207)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_201)
	.word	0,(.Lmain_main_204)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_200)
	.word	0,(.Lmain_main_201)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_195)
	.word	0,(.Lmain_main_200)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_194)
	.word	0,(.Lmain_main_195)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_193)
	.word	0,(.Lmain_main_194)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_192)
	.word	0,(.Lmain_main_193)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_189)
	.word	0,(.Lmain_main_192)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_188)
	.word	0,(.Lmain_main_189)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_182)
	.word	0,(.Lmain_main_188)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_181)
	.word	0,(.Lmain_main_182)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_180)
	.word	0,(.Lmain_main_181)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_179)
	.word	0,(.Lmain_main_180)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_177)
	.word	0,(.Lmain_main_179)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_176)
	.word	0,(.Lmain_main_177)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_175)
	.word	0,(.Lmain_main_176)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_174)
	.word	0,(.Lmain_main_175)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_172)
	.word	0,(.Lmain_main_174)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_171)
	.word	0,(.Lmain_main_172)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_170)
	.word	0,(.Lmain_main_171)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_169)
	.word	0,(.Lmain_main_170)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_166)
	.word	0,(.Lmain_main_169)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_163)
	.word	0,(.Lmain_main_166)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_162)
	.word	0,(.Lmain_main_163)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_157)
	.word	0,(.Lmain_main_162)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_156)
	.word	0,(.Lmain_main_157)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_155)
	.word	0,(.Lmain_main_156)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_154)
	.word	0,(.Lmain_main_155)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_151)
	.word	0,(.Lmain_main_154)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_150)
	.word	0,(.Lmain_main_151)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_144)
	.word	0,(.Lmain_main_150)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_143)
	.word	0,(.Lmain_main_144)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_142)
	.word	0,(.Lmain_main_143)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_141)
	.word	0,(.Lmain_main_142)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_139)
	.word	0,(.Lmain_main_141)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_138)
	.word	0,(.Lmain_main_139)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_137)
	.word	0,(.Lmain_main_138)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_136)
	.word	0,(.Lmain_main_137)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_134)
	.word	0,(.Lmain_main_136)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_133)
	.word	0,(.Lmain_main_134)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_132)
	.word	0,(.Lmain_main_133)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_131)
	.word	0,(.Lmain_main_132)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_128)
	.word	0,(.Lmain_main_131)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_115)
	.word	0,(.Lmain_main_128)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_114)
	.word	0,(.Lmain_main_115)
	.word	2
	.byte	120
	.sleb128	24
	.word	0,(.Lmain_main_113)
	.word	0,(.Lmain_main_114)
	.word	2
	.byte	120
	.sleb128	23
	.word	0,(.Lmain_main_112)
	.word	0,(.Lmain_main_113)
	.word	2
	.byte	120
	.sleb128	22
	.word	0,(.Lmain_main_100)
	.word	0,(.Lmain_main_112)
	.word	2
	.byte	120
	.sleb128	21
	.word	0,(.Lmain_main_99)
	.word	0,(.Lmain_main_100)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,0
	.word	0,0
	.word	0,(.Lmain_init_94)
	.word	0,(.Lmain_init_97)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_93)
	.word	0,(.Lmain_init_94)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_91)
	.word	0,(.Lmain_init_93)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_90)
	.word	0,(.Lmain_init_91)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_88)
	.word	0,(.Lmain_init_90)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_87)
	.word	0,(.Lmain_init_88)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_85)
	.word	0,(.Lmain_init_87)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_84)
	.word	0,(.Lmain_init_85)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_82)
	.word	0,(.Lmain_init_84)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_81)
	.word	0,(.Lmain_init_82)
	.word	2
	.byte	120
	.sleb128	6
	.word	0,(.Lmain_init_80)
	.word	0,(.Lmain_init_81)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_79)
	.word	0,(.Lmain_init_80)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_78)
	.word	0,(.Lmain_init_79)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_76)
	.word	0,(.Lmain_init_78)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_75)
	.word	0,(.Lmain_init_76)
	.word	2
	.byte	120
	.sleb128	6
	.word	0,(.Lmain_init_74)
	.word	0,(.Lmain_init_75)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_73)
	.word	0,(.Lmain_init_74)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_72)
	.word	0,(.Lmain_init_73)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_70)
	.word	0,(.Lmain_init_72)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_69)
	.word	0,(.Lmain_init_70)
	.word	2
	.byte	120
	.sleb128	6
	.word	0,(.Lmain_init_68)
	.word	0,(.Lmain_init_69)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_67)
	.word	0,(.Lmain_init_68)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_66)
	.word	0,(.Lmain_init_67)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_64)
	.word	0,(.Lmain_init_66)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_63)
	.word	0,(.Lmain_init_64)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_62)
	.word	0,(.Lmain_init_63)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_61)
	.word	0,(.Lmain_init_62)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_59)
	.word	0,(.Lmain_init_61)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_58)
	.word	0,(.Lmain_init_59)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_57)
	.word	0,(.Lmain_init_58)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_56)
	.word	0,(.Lmain_init_57)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_55)
	.word	0,(.Lmain_init_56)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_53)
	.word	0,(.Lmain_init_55)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_52)
	.word	0,(.Lmain_init_53)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_51)
	.word	0,(.Lmain_init_52)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_50)
	.word	0,(.Lmain_init_51)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_49)
	.word	0,(.Lmain_init_50)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_47)
	.word	0,(.Lmain_init_49)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_46)
	.word	0,(.Lmain_init_47)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_45)
	.word	0,(.Lmain_init_46)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_44)
	.word	0,(.Lmain_init_45)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_43)
	.word	0,(.Lmain_init_44)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_41)
	.word	0,(.Lmain_init_43)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_40)
	.word	0,(.Lmain_init_41)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_39)
	.word	0,(.Lmain_init_40)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_38)
	.word	0,(.Lmain_init_39)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_37)
	.word	0,(.Lmain_init_38)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_35)
	.word	0,(.Lmain_init_37)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_34)
	.word	0,(.Lmain_init_35)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_33)
	.word	0,(.Lmain_init_34)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_32)
	.word	0,(.Lmain_init_33)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_31)
	.word	0,(.Lmain_init_32)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_29)
	.word	0,(.Lmain_init_31)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_28)
	.word	0,(.Lmain_init_29)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_27)
	.word	0,(.Lmain_init_28)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_26)
	.word	0,(.Lmain_init_27)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_25)
	.word	0,(.Lmain_init_26)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_23)
	.word	0,(.Lmain_init_25)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_22)
	.word	0,(.Lmain_init_23)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_21)
	.word	0,(.Lmain_init_22)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_20)
	.word	0,(.Lmain_init_21)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_19)
	.word	0,(.Lmain_init_20)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_17)
	.word	0,(.Lmain_init_19)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_16)
	.word	0,(.Lmain_init_17)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_15)
	.word	0,(.Lmain_init_16)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_14)
	.word	0,(.Lmain_init_15)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_13)
	.word	0,(.Lmain_init_14)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_11)
	.word	0,(.Lmain_init_13)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_10)
	.word	0,(.Lmain_init_11)
	.word	2
	.byte	120
	.sleb128	5
	.word	0,(.Lmain_init_9)
	.word	0,(.Lmain_init_10)
	.word	2
	.byte	120
	.sleb128	4
	.word	0,(.Lmain_init_8)
	.word	0,(.Lmain_init_9)
	.word	2
	.byte	120
	.sleb128	3
	.word	0,(.Lmain_init_7)
	.word	0,(.Lmain_init_8)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_4)
	.word	0,(.Lmain_init_7)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,(.Lmain_init_3)
	.word	0,(.Lmain_init_4)
	.word	2
	.byte	120
	.sleb128	2
	.word	0,(.Lmain_init_1)
	.word	0,(.Lmain_init_3)
	.word	2
	.byte	120
	.sleb128	1
	.word	0,0
	.word	0,0

	.section .debug_abbrev, ""
.Ldebug_abbrev:
	.uleb128	9
	.uleb128	52
	.byte	0
	.uleb128	2
	.uleb128	10
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	4
	.uleb128	46
	.byte	1
	.uleb128	1
	.uleb128	19
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	73
	.uleb128	19
	.uleb128	0
	.uleb128	0
	.uleb128	6
	.uleb128	11
	.byte	1
	.uleb128	17
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	1
	.uleb128	17
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	16
	.uleb128	6
	.uleb128	19
	.uleb128	11
	.uleb128	37
	.uleb128	8
	.uleb128	0
	.uleb128	0
	.uleb128	8
	.uleb128	11
	.byte	0
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	5
	.uleb128	11
	.byte	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	2
	.uleb128	46
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	63
	.uleb128	12
	.uleb128	64
	.uleb128	6
	.uleb128	0
	.uleb128	0
	.uleb128	7
	.uleb128	11
	.byte	1
	.uleb128	1
	.uleb128	19
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.uleb128	0
	.uleb128	0
	.uleb128	3
	.uleb128	36
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	11
	.uleb128	11
	.uleb128	62
	.uleb128	11
	.uleb128	0
	.uleb128	0
	.uleb128	0

	.section .debug_info, ""
	.word	0,.Ldebug_info_end-.Ldebug_info_start
.Ldebug_info_start:
	.word	2
	.word	0,(.Ldebug_abbrev)
	.byte	4
	.uleb128	1
	.ascii "./src/main.c"
	.byte	0
	.word	0,(.Ldebug_line_start+-4)
	.byte	1
	.ascii "SDCC version 3.9.3 #11345"
	.byte	0
	.uleb128	2
	.ascii "init"
	.byte	0
	.word	0,(_init)
	.word	0,(.Lmain_initendf+1)
	.byte	1
	.word	0,(.Ldebug_loc_start+848)
	.uleb128	3
	.ascii "int"
	.byte	0
	.byte	2
	.byte	5
	.uleb128	4
	.word	0,304
	.ascii "main"
	.byte	0
	.word	0,(_main)
	.word	0,(.Lmain_mainendf+1)
	.byte	1
	.word	0,(.Ldebug_loc_start)
	.word	0,75
	.uleb128	5
	.word	0,234
	.word	0,(.Lmain_main_107)
	.uleb128	6
	.word	0,(.Lmain_main_109)
	.uleb128	7
	.word	0,152
	.word	0,(.Lmain_main_116)
	.word	0,(.Lmain_main_125)
	.uleb128	6
	.word	0,(.Lmain_main_118)
	.uleb128	8
	.word	0,(.Lmain_main_121)
	.word	0,(.Lmain_main_123)
	.uleb128	0
	.uleb128	0
	.uleb128	5
	.word	0,180
	.word	0,(.Lmain_main_129)
	.uleb128	8
	.word	0,(.Lmain_main_145)
	.word	0,(.Lmain_main_152)
	.uleb128	8
	.word	0,(.Lmain_main_158)
	.word	0,(.Lmain_main_164)
	.uleb128	0
	.uleb128	5
	.word	0,208
	.word	0,(.Lmain_main_167)
	.uleb128	8
	.word	0,(.Lmain_main_183)
	.word	0,(.Lmain_main_190)
	.uleb128	8
	.word	0,(.Lmain_main_196)
	.word	0,(.Lmain_main_202)
	.uleb128	0
	.uleb128	6
	.word	0,(.Lmain_main_205)
	.uleb128	8
	.word	0,(.Lmain_main_221)
	.word	0,(.Lmain_main_228)
	.uleb128	8
	.word	0,(.Lmain_main_234)
	.word	0,(.Lmain_main_240)
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-20
	.ascii "mod"
	.byte	0
	.word	0,304
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-19
	.ascii "time"
	.byte	0
	.word	0,321
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-15
	.ascii "r"
	.byte	0
	.word	0,338
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-13
	.ascii "g"
	.byte	0
	.word	0,338
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-11
	.ascii "b"
	.byte	0
	.word	0,338
	.uleb128	9
	.byte	2
	.byte	145
	.sleb128	-9
	.ascii "s_mem"
	.byte	0
	.word	0,304
	.uleb128	0
	.uleb128	3
	.ascii "unsigned char"
	.byte	0
	.byte	1
	.byte	8
	.uleb128	3
	.ascii "unsigned long"
	.byte	0
	.byte	4
	.byte	7
	.uleb128	3
	.ascii "unsigned int"
	.byte	0
	.byte	2
	.byte	7
	.uleb128	0
	.uleb128	0
	.uleb128	0
.Ldebug_info_end:

	.section .debug_pubnames, ""
	.word	0,.Ldebug_pubnames_end-.Ldebug_pubnames_start
.Ldebug_pubnames_start:
	.word	2
	.word	0,(.Ldebug_info_start-4)
	.word	0,4+.Ldebug_info_end-.Ldebug_info_start
	.word	0,56
	.ascii "init"
	.byte	0
	.word	0,82
	.ascii "main"
	.byte	0
	.word	0,0
.Ldebug_pubnames_end:

	.section .debug_frame, ""
	.word	0
	.word	4+.Ldebug_CIE0_end-.Ldebug_CIE0_start
.Ldebug_CIE0_start:
	.word	0xffff
	.word	0xffff
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-1
	.byte	9
	.byte	12
	.uleb128	8
	.uleb128	2
	.byte	137
	.uleb128	1
.Ldebug_CIE0_end:
	.word	0,502
	.word	0,(.Ldebug_CIE0_start-4)
	.word	0,(.Lmain_main_99)	;initial loc
	.word	0,.Lmain_main_244-.Lmain_main_99
	.byte	1
	.word	0,(.Lmain_main_99)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_main_100)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_112)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_113)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_114)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_115)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_128)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_131)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_132)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_133)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_134)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_136)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_137)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_138)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_139)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_141)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_142)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_143)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_144)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_150)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_151)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_154)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_155)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_156)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_157)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_162)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_163)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_166)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_169)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_170)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_171)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_172)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_174)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_175)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_176)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_177)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_179)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_180)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_181)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_182)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_188)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_189)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_192)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_193)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_194)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_195)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_200)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_201)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_204)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_207)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_208)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_209)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_210)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_212)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_213)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_214)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_215)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_217)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_218)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_219)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_220)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_226)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_227)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_230)
	.byte	14
	.uleb128	23
	.byte	1
	.word	0,(.Lmain_main_231)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_232)
	.byte	14
	.uleb128	25
	.byte	1
	.word	0,(.Lmain_main_233)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_238)
	.byte	14
	.uleb128	24
	.byte	1
	.word	0,(.Lmain_main_239)
	.byte	14
	.uleb128	22
	.byte	1
	.word	0,(.Lmain_main_242)
	.byte	14
	.uleb128	2

	.section .debug_frame, ""
	.word	0
	.word	4+.Ldebug_CIE1_end-.Ldebug_CIE1_start
.Ldebug_CIE1_start:
	.word	0xffff
	.word	0xffff
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-1
	.byte	9
	.byte	12
	.uleb128	8
	.uleb128	2
	.byte	137
	.uleb128	1
.Ldebug_CIE1_end:
	.word	0,537
	.word	0,(.Ldebug_CIE1_start-4)
	.word	0,(.Lmain_init_1)	;initial loc
	.word	0,.Lmain_init_97-.Lmain_init_1
	.byte	1
	.word	0,(.Lmain_init_1)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_3)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_4)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_7)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_8)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_9)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_10)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_11)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_13)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_14)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_15)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_16)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_17)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_19)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_20)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_21)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_22)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_23)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_25)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_26)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_27)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_28)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_29)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_31)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_32)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_33)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_34)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_35)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_37)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_38)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_39)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_40)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_41)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_43)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_44)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_45)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_46)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_47)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_49)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_50)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_51)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_52)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_53)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_55)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_56)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_57)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_58)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_59)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_61)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_62)
	.byte	14
	.uleb128	4
	.byte	1
	.word	0,(.Lmain_init_63)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_64)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_66)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_67)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_68)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_69)
	.byte	14
	.uleb128	7
	.byte	1
	.word	0,(.Lmain_init_70)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_72)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_73)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_74)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_75)
	.byte	14
	.uleb128	7
	.byte	1
	.word	0,(.Lmain_init_76)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_78)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_79)
	.byte	14
	.uleb128	5
	.byte	1
	.word	0,(.Lmain_init_80)
	.byte	14
	.uleb128	6
	.byte	1
	.word	0,(.Lmain_init_81)
	.byte	14
	.uleb128	7
	.byte	1
	.word	0,(.Lmain_init_82)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_84)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_85)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_87)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_88)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_90)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_91)
	.byte	14
	.uleb128	2
	.byte	1
	.word	0,(.Lmain_init_93)
	.byte	14
	.uleb128	3
	.byte	1
	.word	0,(.Lmain_init_94)
	.byte	14
	.uleb128	2
