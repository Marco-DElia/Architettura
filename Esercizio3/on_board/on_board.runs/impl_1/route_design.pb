
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px� 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px� 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px� 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px� 
C
.Phase 1 Build RT Design | Checksum: 129fe13d5
*commonh px� 
�

%s
*constraints2p
\Time (s): cpu = 00:00:45 ; elapsed = 00:00:40 . Memory (MB): peak = 1940.383 ; gain = 95.0782default:defaulth px� 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px� 
{

Phase %s%s
101*constraints2
2.1 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px� 
N
9Phase 2.1 Fix Topology Constraints | Checksum: 129fe13d5
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:40 . Memory (MB): peak = 1946.934 ; gain = 101.6292default:defaulth px� 
t

Phase %s%s
101*constraints2
2.2 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px� 
G
2Phase 2.2 Pre Route Cleanup | Checksum: 129fe13d5
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:40 . Memory (MB): peak = 1946.934 ; gain = 101.6292default:defaulth px� 
p

Phase %s%s
101*constraints2
2.3 2default:default2!
Update Timing2default:defaultZ18-101h px� 
C
.Phase 2.3 Update Timing | Checksum: 15e11b62c
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:40 . Memory (MB): peak = 1955.949 ; gain = 110.6452default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.414  | TNS=0.000  | WHS=-0.086 | THS=-0.224 |
2default:defaultZ35-416h px� 
I
4Phase 2 Router Initialization | Checksum: 15f4d0d42
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px� 
q

Phase %s%s
101*constraints2
3.1 2default:default2"
Global Routing2default:defaultZ18-101h px� 
D
/Phase 3.1 Global Routing | Checksum: 15f4d0d42
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
C
.Phase 3 Initial Routing | Checksum: 220066e59
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px� 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.096  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px� 
H
3Phase 4.1 Global Iteration 0 | Checksum: 21b41d2e8
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
F
1Phase 4 Rip-up And Reroute | Checksum: 21b41d2e8
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px� 
C
.Phase 5.1 Delay CleanUp | Checksum: 21b41d2e8
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px� 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 21b41d2e8
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
O
:Phase 5 Delay and Skew Optimization | Checksum: 21b41d2e8
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px� 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px� 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px� 
E
0Phase 6.1.1 Update Timing | Checksum: 29780c030
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
�
Intermediate Timing Summary %s164*route2J
6| WNS=4.192  | TNS=0.000  | WHS=0.235  | THS=0.000  |
2default:defaultZ35-416h px� 
C
.Phase 6.1 Hold Fix Iter | Checksum: 29780c030
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
A
,Phase 6 Post Hold Fix | Checksum: 29780c030
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px� 
B
-Phase 7 Route finalize | Checksum: 28fcc7cd0
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px� 
I
4Phase 8 Verifying routed nets | Checksum: 28fcc7cd0
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px� 
E
0Phase 9 Depositing Routes | Checksum: 21a757043
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px� 
�
Estimated Timing Summary %s
57*route2J
6| WNS=4.192  | TNS=0.000  | WHS=0.235  | THS=0.000  |
2default:defaultZ35-57h px� 
�
�The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px� 
G
2Phase 10 Post Router Timing | Checksum: 21a757043
*commonh px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
@
Router Completed Successfully
2*	routeflowZ35-16h px� 
�

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:41 . Memory (MB): peak = 1960.637 ; gain = 115.3322default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
842default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:00:472default:default2
00:00:422default:default2
1960.6372default:default2
124.4612default:defaultZ17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:002default:default2 
00:00:00.0472default:default2
1971.1602default:default2
10.5232default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2�
oC:/Users/Marco/Desktop/GitHub/Architettura/Esercizio3/on_board/on_board.runs/impl_1/led_button_prova_routed.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2�
�Executing : report_drc -file led_button_prova_drc_routed.rpt -pb led_button_prova_drc_routed.pb -rpx led_button_prova_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
xreport_drc -file led_button_prova_drc_routed.rpt -pb led_button_prova_drc_routed.pb -rpx led_button_prova_drc_routed.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
sC:/Users/Marco/Desktop/GitHub/Architettura/Esercizio3/on_board/on_board.runs/impl_1/led_button_prova_drc_routed.rptsC:/Users/Marco/Desktop/GitHub/Architettura/Esercizio3/on_board/on_board.runs/impl_1/led_button_prova_drc_routed.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_methodology -file led_button_prova_methodology_drc_routed.rpt -pb led_button_prova_methodology_drc_routed.pb -rpx led_button_prova_methodology_drc_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_methodology -file led_button_prova_methodology_drc_routed.rpt -pb led_button_prova_methodology_drc_routed.pb -rpx led_button_prova_methodology_drc_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px� 
�
2The results of Report Methodology are in file %s.
609*	vivadotcl2�
C:/Users/Marco/Desktop/GitHub/Architettura/Esercizio3/on_board/on_board.runs/impl_1/led_button_prova_methodology_drc_routed.rptC:/Users/Marco/Desktop/GitHub/Architettura/Esercizio3/on_board/on_board.runs/impl_1/led_button_prova_methodology_drc_routed.rpt2default:default8Z2-1520h px� 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px� 
�
%s4*runtcl2�
�Executing : report_power -file led_button_prova_power_routed.rpt -pb led_button_prova_power_summary_routed.pb -rpx led_button_prova_power_routed.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2�
�report_power -file led_button_prova_power_routed.rpt -pb led_button_prova_power_summary_routed.pb -rpx led_button_prova_power_routed.rpx2default:defaultZ4-113h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
962default:default2
02default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px� 
�
%s4*runtcl2�
mExecuting : report_route_status -file led_button_prova_route_status.rpt -pb led_button_prova_route_status.pb
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_timing_summary -max_paths 10 -report_unconstrained -file led_button_prova_timing_summary_routed.rpt -pb led_button_prova_timing_summary_routed.pb -rpx led_button_prova_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 
�
%s4*runtcl2m
YExecuting : report_incremental_reuse -file led_button_prova_incremental_reuse_routed.rpt
2default:defaulth px� 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px� 
�
%s4*runtcl2m
YExecuting : report_clock_utilization -file led_button_prova_clock_utilization_routed.rpt
2default:defaulth px� 
�
%s4*runtcl2�
�Executing : report_bus_skew -warn_on_violation -file led_button_prova_bus_skew_routed.rpt -pb led_button_prova_bus_skew_routed.pb -rpx led_button_prova_bus_skew_routed.rpx
2default:defaulth px� 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px� 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px� 


End Record