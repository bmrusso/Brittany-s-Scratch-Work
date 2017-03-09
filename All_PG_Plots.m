% Loading all the zones and creating a PGV and PGA vs distance plot for
% every zone

clc, clear

load num_eq_data.mat
load peak_ground_data.mat

lavec(14) = [ ];
lovec(14) = [ ];
lovec(10) = [ ];
lavec(10) = [ ];
PGV_total(9) = [ ];
PGA_total(9) = [ ];
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
PGA_total{1}(190) = [ ];
PGA_total{1}(177) = [ ];
PGA_total{1}(175) = [ ];
PGA_total{1}(174) = [ ];
PGA_total{1}(143) = [ ];
PGA_total{1}(142) = [ ];

figure(1)
plot(kmlen', PGV_total{1}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(2)
plot(kmlen', PGA_total{1}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Cog
load Cog_struct.mat

deglen = distance(lavec{2}, lovec{2}, cog_data{length(cog_data)}(1).latitude,...
    cog_data{length(cog_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(428) = [ ];
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
kmlen(258) = [ ];
kmlen(256) = [ ];
kmlen(252) = [ ];
kmlen(249) = [ ];
kmlen(242) = [ ];
kmlen(238:240) = [ ];
kmlen(234:235) = [ ];
kmlen(230:231) = [ ];
kmlen(228) = [ ];
kmlen(208:210) = [ ];
kmlen(203) = [ ];

PGV_total{2}(428) = [ ];
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
PGV_total{2}(258) = [ ];
PGV_total{2}(256) = [ ];
PGV_total{2}(252) = [ ];
PGV_total{2}(249) = [ ];
PGV_total{2}(242) = [ ];
PGV_total{2}(238:240) = [ ];
PGV_total{2}(234:235) = [ ];
PGV_total{2}(230:231) = [ ];
PGV_total{2}(228) = [ ];
PGV_total{2}(208:210) = [ ];
PGV_total{2}(203) = [ ];

PGA_total{2}(428) = [ ];
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
PGA_total{2}(258) = [ ];
PGA_total{2}(256) = [ ];
PGA_total{2}(252) = [ ];
PGA_total{2}(249) = [ ];
PGA_total{2}(242) = [ ];
PGA_total{2}(238:240) = [ ];
PGA_total{2}(234:235) = [ ];
PGA_total{2}(230:231) = [ ];
PGA_total{2}(228) = [ ];
PGA_total{2}(208:210) = [ ];
PGA_total{2}(203) = [ ];

figure(3)
plot(kmlen', PGV_total{2}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(4)
plot(kmlen', PGA_total{2}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Dagger
load Dagger_struct.mat

deglen = distance(lavec{3}, lovec{3}, dagger_data{length(dagger_data)}(1).latitude,...
    dagger_data{length(dagger_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(297) = [ ];
kmlen(292) = [ ];
kmlen(233) = [ ];
kmlen(215) = [ ];
kmlen(155) = [ ];
kmlen(143) = [ ];
kmlen(137) = [ ];
kmlen(128) = [ ];
kmlen(117:118) = [ ];
kmlen(103) = [ ];

PGV_total{3}(297) = [ ];
PGV_total{3}(292) = [ ];
PGV_total{3}(233) = [ ];
PGV_total{3}(215) = [ ];
PGV_total{3}(155) = [ ];
PGV_total{3}(143) = [ ];
PGV_total{3}(137) = [ ];
PGV_total{3}(128) = [ ];
PGV_total{3}(117:118) = [ ];
PGV_total{3}(103) = [ ];

PGA_total{3}(297) = [ ];
PGA_total{3}(292) = [ ];
PGA_total{3}(233) = [ ];
PGA_total{3}(215) = [ ];
PGA_total{3}(155) = [ ];
PGA_total{3}(143) = [ ];
PGA_total{3}(137) = [ ];
PGA_total{3}(128) = [ ];
PGA_total{3}(117:118) = [ ];
PGA_total{3}(103) = [ ];

figure(5)
plot(kmlen', PGV_total{3}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(6)
plot(kmlen', PGA_total{3}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Fash
load Fash_struct.mat

deglen = distance(lavec{4}, lovec{4}, fash_data{length(fash_data)}(1).latitude,...
    fash_data{length(fash_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(575) = [ ];
kmlen(526) = [ ];
kmlen(439) = [ ];
kmlen(434) = [ ];
kmlen(430:431) = [ ];
kmlen(415) = [ ];
kmlen(408) = [ ];
kmlen(395:396) = [ ];
kmlen(391:393) = [ ];
kmlen(383:385) = [ ];
kmlen(374:377) = [ ];
kmlen(368) = [ ];
kmlen(364:366) = [ ];
kmlen(358:361) = [ ];

PGV_total{4}(575) = [ ];
PGV_total{4}(526) = [ ];
PGV_total{4}(439) = [ ];
PGV_total{4}(434) = [ ];
PGV_total{4}(430:431) = [ ];
PGV_total{4}(415) = [ ];
PGV_total{4}(408) = [ ];
PGV_total{4}(395:396) = [ ];
PGV_total{4}(391:393) = [ ];
PGV_total{4}(383:385) = [ ];
PGV_total{4}(374:377) = [ ];
PGV_total{4}(368) = [ ];
PGV_total{4}(364:366) = [ ];
PGV_total{4}(358:361) = [ ];

PGA_total{4}(575) = [ ];
PGA_total{4}(526) = [ ];
PGA_total{4}(439) = [ ];
PGA_total{4}(434) = [ ];
PGA_total{4}(430:431) = [ ];
PGA_total{4}(415) = [ ];
PGA_total{4}(408) = [ ];
PGA_total{4}(395:396) = [ ];
PGA_total{4}(391:393) = [ ];
PGA_total{4}(383:385) = [ ];
PGA_total{4}(374:377) = [ ];
PGA_total{4}(368) = [ ];
PGA_total{4}(364:366) = [ ];
PGA_total{4}(358:361) = [ ];

figure(7)
plot(kmlen', PGV_total{4}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(8)
plot(kmlen', PGA_total{4}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% NCArk
load NCArk_struct.mat

deglen = distance(lavec{5}, lovec{5}, ncark_data{length(ncark_data)}(1).latitude,...
    ncark_data{length(ncark_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(107) = [ ];
PGV_total{5}(107) = [ ];
PGA_total{5}(107) = [ ];

figure(9)
plot(kmlen', PGV_total{5}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(10)
plot(kmlen', PGA_total{5}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Greeley
load Greeley_struct.mat

deglen = distance(lavec{6}, lovec{6}, greeley_data{length(greeley_data)}(1).latitude,...
    greeley_data{length(greeley_data)}(1).longitude);

kmlen = deg2km(deglen);

figure(11)
plot(kmlen', PGV_total{6}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(12)
plot(kmlen', PGA_total{6}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

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

figure(11)
plot(kmlen', PGV_total{7}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(12)
plot(kmlen', PGA_total{7}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

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


figure(13)
plot(kmlen', PGV_total{8}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(14)
plot(kmlen', PGA_total{8}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Raton
load Raton_struct.mat
load num_eq_data.mat
load peak_ground_data.mat

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

figure(15)
plot(kmlen', PGV_total{10}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(16)
plot(kmlen', PGA_total{10}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% SunCity
load SunCity_struct.mat

deglen = distance(lavec{11}, lovec{11}, suncity_data{length(suncity_data)}(1).latitude,...
    suncity_data{length(suncity_data)}(1).longitude);

kmlen = deg2km(deglen);

figure(17)
plot(kmlen', PGV_total{11}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(18)
plot(kmlen', PGA_total{11}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

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

figure(19)
plot(kmlen', PGV_total{12}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(20)
plot(kmlen', PGA_total{12}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')

%% Youngs
load Youngs_struct.mat

deglen = distance(lavec{13}, lovec{13}, youngs_data{length(youngs_data)}(1).latitude,...
    youngs_data{length(youngs_data)}(1).longitude);

kmlen = deg2km(deglen);

kmlen(87) = [ ];

PGV_total{12}(87) = [ ];

PGA_total{12}(87) = [ ];

figure(21)
plot(kmlen', PGV_total{13}, 'o', 'markerfacecolor', 'b')
title('PGV vs Distance (km)')

figure(22)
plot(kmlen', PGA_total{13}, 'd', 'markerfacecolor', 'b')
title('PGA vs Distance (km)')