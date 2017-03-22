% Loading all the zones and creating a PGV and PGA vs distance plot for
% every zone

clc, clear

load num_eq_data.mat
load peak_ground_data.mat

lavec(14) = [ ];
lovec(14) = [ ];
lavec(8) = [ ];
lovec(8) = [ ];

%% Brewt
load Brewt_struct.mat

deglen = distance(lavec{1}, lovec{1}, brewt_data{length(brewt_data)}(1).latitude,...
    brewt_data{length(brewt_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(290) = [ ];
kmlen(283) = [ ];
kmlen(277) = [ ];
kmlen(270) = [ ];
kmlen(260) = [ ];
kmlen(190) = [ ];
kmlen(177) = [ ];
kmlen(175) = [ ];
kmlen(174) = [ ];
kmlen(143) = [ ];
kmlen(142) = [ ];

PGV_total{1}(290) = [ ];
PGV_total{1}(283) = [ ];
PGV_total{1}(277) = [ ];
PGV_total{1}(270) = [ ];
PGV_total{1}(260) = [ ];
PGV_total{1}(190) = [ ];
PGV_total{1}(177) = [ ];
PGV_total{1}(175) = [ ];
PGV_total{1}(174) = [ ];
PGV_total{1}(143) = [ ];
PGV_total{1}(142) = [ ];

PGA_total{1}(290) = [ ];
PGA_total{1}(283) = [ ];
PGA_total{1}(277) = [ ];
PGA_total{1}(270) = [ ];
PGA_total{1}(260) = [ ];
PGA_total{1}(190) = [ ];
PGA_total{1}(177) = [ ];
PGA_total{1}(175) = [ ];
PGA_total{1}(174) = [ ];
PGA_total{1}(143) = [ ];
PGA_total{1}(142) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{1}(index) = [ ];
PGV_total{1}(index) = [ ];
kmlen1 = kmlen;

% figure(1)
% plot(kmlen', PGV_total{1}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)- Brewt')
% 
% figure(2)
% plot(kmlen', PGA_total{1}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Brewt')

%% Cog
load Cog_struct.mat

deglen = distance(lavec{2}, lovec{2}, cog_data{length(cog_data)}(1).latitude,...
    cog_data{length(cog_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(560) = [ ];
kmlen(522) = [ ];
kmlen(428) = [ ];
kmlen(407) = [ ];
kmlen(399) = [ ];
kmlen(394) = [ ];
kmlen(386:387) = [ ];
kmlen(362:363) = [ ];
kmlen(351:354) = [ ];
kmlen(349) = [ ];
kmlen(341:345) = [ ];
kmlen(333:335) = [ ];
kmlen(328:331) = [ ];
kmlen(324) = [ ];
kmlen(308:309) = [ ];
kmlen(298) = [ ];
kmlen(291:292) = [ ];
kmlen(286:287) = [ ];
kmlen(280) = [ ];
kmlen(271:272) = [ ];
kmlen(268:269) = [ ];
kmlen(265) = [ ];
kmlen(261) = [ ];
kmlen(256:258) = [ ];
kmlen(252) = [ ];
kmlen(249) = [ ];
kmlen(246) = [ ];
kmlen(238:242) = [ ];
kmlen(234:235) = [ ];
kmlen(230:231) = [ ];
kmlen(228) = [ ];
kmlen(208:210) = [ ];
kmlen(203) = [ ];

PGV_total{2}(560) = [ ];
PGV_total{2}(522) = [ ];
PGV_total{2}(428) = [ ];
PGV_total{2}(407) = [ ];
PGV_total{2}(399) = [ ];
PGV_total{2}(394) = [ ];
PGV_total{2}(386:387) = [ ];
PGV_total{2}(362:363) = [ ];
PGV_total{2}(351:354) = [ ];
PGV_total{2}(349) = [ ];
PGV_total{2}(341:345) = [ ];
PGV_total{2}(333:335) = [ ];
PGV_total{2}(328:331) = [ ];
PGV_total{2}(324) = [ ];
PGV_total{2}(308:309) = [ ];
PGV_total{2}(298) = [ ];
PGV_total{2}(291:292) = [ ];
PGV_total{2}(286:287) = [ ];
PGV_total{2}(280) = [ ];
PGV_total{2}(271:272) = [ ];
PGV_total{2}(268:269) = [ ];
PGV_total{2}(265) = [ ];
PGV_total{2}(261) = [ ];
PGV_total{2}(256:258) = [ ];
PGV_total{2}(252) = [ ];
PGV_total{2}(249) = [ ];
PGV_total{2}(246) = [ ];
PGV_total{2}(238:242) = [ ];
PGV_total{2}(234:235) = [ ];
PGV_total{2}(230:231) = [ ];
PGV_total{2}(228) = [ ];
PGV_total{2}(208:210) = [ ];
PGV_total{2}(203) = [ ];

PGA_total{2}(560) = [ ];
PGA_total{2}(522) = [ ];
PGA_total{2}(428) = [ ];
PGA_total{2}(407) = [ ];
PGA_total{2}(399) = [ ];
PGA_total{2}(394) = [ ];
PGA_total{2}(386:387) = [ ];
PGA_total{2}(362:363) = [ ];
PGA_total{2}(351:354) = [ ];
PGA_total{2}(349) = [ ];
PGA_total{2}(341:345) = [ ];
PGA_total{2}(333:335) = [ ];
PGA_total{2}(328:331) = [ ];
PGA_total{2}(324) = [ ];
PGA_total{2}(308:309) = [ ];
PGA_total{2}(298) = [ ];
PGA_total{2}(291:292) = [ ];
PGA_total{2}(286:287) = [ ];
PGA_total{2}(280) = [ ];
PGA_total{2}(271:272) = [ ];
PGA_total{2}(268:269) = [ ];
PGA_total{2}(265) = [ ];
PGA_total{2}(261) = [ ];
PGA_total{2}(256:258) = [ ];
PGA_total{2}(252) = [ ];
PGA_total{2}(249) = [ ];
PGA_total{2}(246) = [ ];
PGA_total{2}(238:242) = [ ];
PGA_total{2}(234:235) = [ ];
PGA_total{2}(230:231) = [ ];
PGA_total{2}(228) = [ ];
PGA_total{2}(208:210) = [ ];
PGA_total{2}(203) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{2}(index) = [ ];
PGV_total{2}(index) = [ ];
kmlen2 = kmlen;

% figure(3)
% plot(kmlen', PGV_total{2}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Cog')
% 
% figure(4)
% plot(kmlen', PGA_total{2}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Cog')

%% Dagger
load Dagger_struct.mat

deglen = distance(lavec{3}, lovec{3}, dagger_data{length(dagger_data)}(1).latitude,...
    dagger_data{length(dagger_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(297) = [ ];
kmlen(292) = [ ];
kmlen(244) = [ ];
kmlen(233) = [ ];
kmlen(215) = [ ];
kmlen(155) = [ ];
kmlen(143) = [ ];
kmlen(137:138) = [ ];
kmlen(128) = [ ];
kmlen(117:118) = [ ];
kmlen(103) = [ ];
kmlen(94) = [ ];

PGV_total{3}(297) = [ ];
PGV_total{3}(292) = [ ];
PGV_total{3}(244) = [ ];
PGV_total{3}(233) = [ ];
PGV_total{3}(215) = [ ];
PGV_total{3}(155) = [ ];
PGV_total{3}(143) = [ ];
PGV_total{3}(137:138) = [ ];
PGV_total{3}(128) = [ ];
PGV_total{3}(117:118) = [ ];
PGV_total{3}(103) = [ ];
PGV_total{3}(94) = [ ];

PGA_total{3}(297) = [ ];
PGA_total{3}(292) = [ ];
PGA_total{3}(244) = [ ];
PGA_total{3}(233) = [ ];
PGA_total{3}(215) = [ ];
PGA_total{3}(155) = [ ];
PGA_total{3}(143) = [ ];
PGA_total{3}(137:138) = [ ];
PGA_total{3}(128) = [ ];
PGA_total{3}(117:118) = [ ];
PGA_total{3}(103) = [ ];
PGA_total{3}(94) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{3}(index) = [ ];
PGV_total{3}(index) = [ ];
kmlen3 = kmlen;

% figure(5)
% plot(kmlen', PGV_total{3}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Dagger')
% 
% figure(6)
% plot(kmlen', PGA_total{3}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Dagger')

%% Fash
load Fash_struct.mat

deglen = distance(lavec{4}, lovec{4}, fash_data{length(fash_data)}(1).latitude,...
    fash_data{length(fash_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(575) = [ ];
kmlen(570) = [ ];
kmlen(536) = [ ];
kmlen(532) = [ ];
kmlen(526) = [ ];
kmlen(481) = [ ];
kmlen(447:448) = [ ];
kmlen(444) = [ ];
kmlen(439) = [ ];
kmlen(434) = [ ];
kmlen(430:431) = [ ];
kmlen(415) = [ ];
kmlen(408) = [ ];
kmlen(405) = [ ];
kmlen(395:396) = [ ];
kmlen(391:393) = [ ];
kmlen(387) = [ ];
kmlen(383:385) = [ ];
kmlen(374:377) = [ ];
kmlen(368) = [ ];
kmlen(364:366) = [ ];
kmlen(358:361) = [ ];
kmlen(348) = [ ];

PGV_total{4}(575) = [ ];
PGV_total{4}(570) = [ ];
PGV_total{4}(536) = [ ];
PGV_total{4}(532) = [ ];
PGV_total{4}(526) = [ ];
PGV_total{4}(481) = [ ];
PGV_total{4}(447:448) = [ ];
PGV_total{4}(444) = [ ];
PGV_total{4}(439) = [ ];
PGV_total{4}(434) = [ ];
PGV_total{4}(430:431) = [ ];
PGV_total{4}(415) = [ ];
PGV_total{4}(408) = [ ];
PGV_total{4}(405) = [ ];
PGV_total{4}(395:396) = [ ];
PGV_total{4}(391:393) = [ ];
PGV_total{4}(387) = [ ];
PGV_total{4}(383:385) = [ ];
PGV_total{4}(374:377) = [ ];
PGV_total{4}(368) = [ ];
PGV_total{4}(364:366) = [ ];
PGV_total{4}(358:361) = [ ];
PGV_total{4}(348) = [ ];

PGA_total{4}(575) = [ ];
PGA_total{4}(570) = [ ];
PGA_total{4}(536) = [ ];
PGA_total{4}(532) = [ ];
PGA_total{4}(526) = [ ];
PGA_total{4}(481) = [ ];
PGA_total{4}(447:448) = [ ];
PGA_total{4}(444) = [ ];
PGA_total{4}(439) = [ ];
PGA_total{4}(434) = [ ];
PGA_total{4}(430:431) = [ ];
PGA_total{4}(415) = [ ];
PGA_total{4}(408) = [ ];
PGA_total{4}(405) = [ ];
PGA_total{4}(395:396) = [ ];
PGA_total{4}(391:393) = [ ];
PGA_total{4}(387) = [ ];
PGA_total{4}(383:385) = [ ];
PGA_total{4}(374:377) = [ ];
PGA_total{4}(368) = [ ];
PGA_total{4}(364:366) = [ ];
PGA_total{4}(358:361) = [ ];
PGA_total{4}(348) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{4}(index) = [ ];
PGV_total{4}(index) = [ ];
kmlen4 = kmlen;

% figure(7)
% plot(kmlen', PGV_total{4}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Fash')
% 
% figure(8)
% plot(kmlen', PGA_total{4}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Fash')

%% NCArk
load NCArk_struct.mat

deglen = distance(lavec{5}, lovec{5}, ncark_data{length(ncark_data)}(1).latitude,...
    ncark_data{length(ncark_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(107) = [ ];
kmlen(87) = [ ];
kmlen(66) = [ ];

PGV_total{5}(107) = [ ];
PGV_total{5}(87) = [ ];
PGV_total{5}(66) = [ ];

PGA_total{5}(107) = [ ];
PGA_total{5}(87) = [ ];
PGA_total{5}(66) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{5}(index) = [ ];
PGV_total{5}(index) = [ ];
kmlen5 = kmlen;

% figure(9)
% plot(kmlen', PGV_total{5}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-NCArk')
% 
% figure(10)
% plot(kmlen', PGA_total{5}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-NCArk')

%% Greeley
load Greeley_struct.mat

deglen = distance(lavec{6}, lovec{6}, greeley_data{length(greeley_data)}(1).latitude,...
    greeley_data{length(greeley_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(63) = [ ];
PGV_total{6}(63) = [ ];
PGA_total{6}(63) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{6}(index) = [ ];
PGV_total{6}(index) = [ ];
kmlen6 = kmlen;

% figure(11)
% plot(kmlen', PGV_total{6}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Greeley')
% 
% figure(12)
% plot(kmlen', PGA_total{6}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Greeley')

%% Irving_NTX_Venus
load I_NTX_V_struct.mat

deglen = distance(lavec{7}, lovec{7}, I_NTX_V_data{length(I_NTX_V_data)}(1).latitude,...
    I_NTX_V_data{length(I_NTX_V_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(125:129) = [ ];
kmlen(85) = [ ];
kmlen(57) = [ ];
kmlen(49:51) = [ ];
kmlen(37:38) = [ ];
kmlen(20) = [ ];
kmlen(7) = [ ];

PGV_total{7}(125:129) = [ ];
PGV_total{7}(85) = [ ];
PGV_total{7}(57) = [ ];
PGV_total{7}(49:51) = [ ];
PGV_total{7}(37:38) = [ ];
PGV_total{7}(20) = [ ];
PGV_total{7}(7) = [ ];

PGA_total{7}(125:129) = [ ];
PGA_total{7}(85) = [ ];
PGA_total{7}(57) = [ ];
PGA_total{7}(49:51) = [ ];
PGA_total{7}(37:38) = [ ];
PGA_total{7}(20) = [ ];
PGA_total{7}(7) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{7}(index) = [ ];
PGV_total{7}(index) = [ ];
kmlen7 = kmlen;

% figure(13)
% plot(kmlen', PGV_total{7}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-I/NTX/V')
% 
% figure(14)
% plot(kmlen', PGA_total{7}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-I/NTX/V')

%% OKKS
load OK_struct.mat

deglen = distance(lavec{8}, lovec{8}, ok_data{length(ok_data)}(1).latitude,...
    ok_data{length(ok_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(122) = [ ];
kmlen(99) = [ ];
kmlen(34) = [ ];
kmlen(13) = [ ];
kmlen(5) = [ ];

PGV_total{8}(122) = [ ];
PGV_total{8}(99) = [ ];
PGV_total{8}(34) = [ ];
PGV_total{8}(13) = [ ];
PGV_total{8}(5) = [ ];

PGA_total{8}(122) = [ ];
PGA_total{8}(99) = [ ];
PGA_total{8}(34) = [ ];
PGA_total{8}(13) = [ ];
PGA_total{8}(5) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{8}(index) = [ ];
PGV_total{8}(index) = [ ];
kmlen8 = kmlen;

% figure(15)
% plot(kmlen', PGV_total{8}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-OKKS')
% 
% figure(16)
% plot(kmlen', PGA_total{8}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-OKKS')

%% Raton
load Raton_struct.mat

deglen = distance(lavec{10}, lovec{10}, raton_data{length(raton_data)}(1).latitude,...
    raton_data{length(raton_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(223) = [ ];
kmlen(137) = [ ];
kmlen(124) = [ ];
kmlen(98) = [ ];
kmlen(92) = [ ];
kmlen(58) = [ ];
kmlen(39:40) = [ ];
kmlen(28) = [ ];

PGV_total{10}(223) = [ ];
PGV_total{10}(137) = [ ];
PGV_total{10}(124) = [ ];
PGV_total{10}(98) = [ ];
PGV_total{10}(92) = [ ];
PGV_total{10}(58) = [ ];
PGV_total{10}(39:40) = [ ];
PGV_total{10}(28) = [ ];

PGA_total{10}(223) = [ ];
PGA_total{10}(137) = [ ];
PGA_total{10}(124) = [ ];
PGA_total{10}(98) = [ ];
PGA_total{10}(92) = [ ];
PGA_total{10}(58) = [ ];
PGA_total{10}(39:40) = [ ];
PGA_total{10}(28) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{10}(index) = [ ];
PGV_total{10}(index) = [ ];
kmlen10 = kmlen;

% figure(17)
% plot(kmlen', PGV_total{10}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Raton')
% 
% figure(18)
% plot(kmlen', PGA_total{10}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Raton')

%% SunCity
load SunCity_struct.mat

deglen = distance(lavec{11}, lovec{11}, suncity_data{length(suncity_data)}(1).latitude,...
    suncity_data{length(suncity_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(16) = [ ];
PGV_total{11}(16) = [ ];
PGA_total{11}(16) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{11}(index) = [ ];
PGV_total{11}(index) = [ ];
kmlen11 = kmlen;

% figure(19)
% plot(kmlen', PGV_total{11}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-SunCity')
% 
% figure(20)
% plot(kmlen', PGA_total{11}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-SunCity')
% 
%% Timp
load Timp_struct.mat

deglen = distance(lavec{12}, lovec{12}, timp_data{length(timp_data)}(1).latitude,...
    timp_data{length(timp_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(72:76) = [ ];
kmlen(66) = [ ];
kmlen(64) = [ ];
kmlen(32) = [ ];
kmlen(4) = [ ];

PGV_total{12}(72:76) = [ ];
PGV_total{12}(66) = [ ];
PGV_total{12}(64) = [ ];
PGV_total{12}(32) = [ ];
PGV_total{12}(4) = [ ];

PGA_total{12}(72:76) = [ ];
PGA_total{12}(66) = [ ];
PGA_total{12}(64) = [ ];
PGA_total{12}(32) = [ ];
PGA_total{12}(4) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{12}(index) = [ ];
PGV_total{12}(index) = [ ];
kmlen12 = kmlen;

% figure(21)
% plot(kmlen', PGV_total{12}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Timp')
% 
% figure(22)
% plot(kmlen', PGA_total{12}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Timp')

%% Youngs
load Youngs_struct.mat

deglen = distance(lavec{13}, lovec{13}, youngs_data{length(youngs_data)}(1).latitude,...
    youngs_data{length(youngs_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(87) = [ ];
kmlen(70) = [ ];

PGV_total{13}(87) = [ ];
PGV_total{13}(70) = [ ];

PGA_total{13}(87) = [ ];
PGA_total{13}(70) = [ ];

index = find(PGA_total{1} == 0 | PGV_total{1} == 0);
kmlen(index) = [ ];
PGA_total{13}(index) = [ ];
PGV_total{13}(index) = [ ];
kmlen13 = kmlen;

% figure(23)
% plot(kmlen', PGV_total{13}, 'o', 'markerfacecolor', 'b')
% title('PGV vs Distance (km)-Youngs')
% 
% figure(24)
% plot(kmlen', PGA_total{13}, 'd', 'markerfacecolor', 'b')
% title('PGA vs Distance (km)-Youngs')

%% Plotting on one graph 
figure(1)
hold on
plot(kmlen1, PGV_total{1}, 'o', 'markerfacecolor', 'b')
plot(kmlen2, PGV_total{2}, 'o', 'markerfacecolor', 'b')
plot(kmlen3, PGV_total{3}, 'o', 'markerfacecolor', 'b')
plot(kmlen4, PGV_total{4}, 'o', 'markerfacecolor', 'b')
plot(kmlen5, PGV_total{5}, 'o', 'markerfacecolor', 'b')
plot(kmlen6, PGV_total{6}, 'o', 'markerfacecolor', 'b')
plot(kmlen7, PGV_total{7}, 'o', 'markerfacecolor', 'b')
plot(kmlen8, PGV_total{8}, 'o', 'markerfacecolor', 'b')
plot(kmlen10, PGV_total{10}, 'o', 'markerfacecolor', 'b')
plot(kmlen11, PGV_total{11}, 'o', 'markerfacecolor', 'b')
plot(kmlen12, PGV_total{12}, 'o', 'markerfacecolor', 'b')
plot(kmlen13, PGV_total{13}, 'o', 'markerfacecolor', 'b')
title('PGV')
hold off

figure(2)
hold on 
plot(kmlen1, PGA_total{1}, 'o', 'markerfacecolor', 'r')
plot(kmlen2, PGA_total{2}, 'o', 'markerfacecolor', 'r')
plot(kmlen3, PGA_total{3}, 'o', 'markerfacecolor', 'r')
plot(kmlen4, PGA_total{4}, 'o', 'markerfacecolor', 'r')
plot(kmlen5, PGA_total{5}, 'o', 'markerfacecolor', 'r')
plot(kmlen6, PGA_total{6}, 'o', 'markerfacecolor', 'r')
plot(kmlen7, PGA_total{7}, 'o', 'markerfacecolor', 'r')
plot(kmlen8, PGA_total{8}, 'o', 'markerfacecolor', 'r')
plot(kmlen10, PGA_total{10}, 'o', 'markerfacecolor', 'r')
plot(kmlen11, PGA_total{11}, 'o', 'markerfacecolor', 'r')
plot(kmlen12, PGA_total{12}, 'o', 'markerfacecolor', 'r')
plot(kmlen13, PGA_total{13}, 'o', 'markerfacecolor', 'r')
title('PGA')
hold off
