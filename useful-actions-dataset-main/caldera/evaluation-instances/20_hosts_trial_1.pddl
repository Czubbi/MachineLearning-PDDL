;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 20 hosts, 1 user, 1 admin per host, 1 active account per host
(define (problem p20_hosts_trial_1)
(:domain caldera)
(:objects id_gjShare id_fyShare id_gcShare id_ghShare id_gkShare id_gaShare id_gbShare id_geShare id_ggShare id_giShare id_fsShare id_fxShare id_ftShare id_fuShare id_glShare id_fzShare id_fwShare id_gfShare id_fvShare id_gdShare - ObservedShare 
 str__cv str__dl str__en str__ee str__bt str__e str__f str__ch str__co str__dz str__es str__ba str__cw str__dr str__bm str__b str__s str__cp str__cx str__dc str__dd str__dj str__dq str__z str__fr str__fp str__el str__em str__fa str__dk str__y str__bh str__dy str__bo str__ef str__et str__m str__k str__t str__ca str__bg str__bu str__fg str__bv str__james str__cq str__de str__cj str__fh str__alpha str__cc str__fb str__r str__ds str__eu str__ez str__fi str__fo str__cb str__fn str__dx str__bn str__ci str__bf str__eg str__l - string 
 id_bxTimeDelta id_fdTimeDelta id_csTimeDelta id_duTimeDelta id_eiTimeDelta id_dnTimeDelta id_fkTimeDelta id_bqTimeDelta id_dgTimeDelta id_epTimeDelta id_ebTimeDelta id_hTimeDelta id_oTimeDelta id_ceTimeDelta id_vTimeDelta id_bcTimeDelta id_czTimeDelta id_clTimeDelta id_ewTimeDelta id_bjTimeDelta - ObservedTimeDelta 
 id_inRat id_icRat id_ihRat id_isRat id_imRat id_idRat id_iiRat id_iaRat id_itRat id_ieRat id_ilRat id_ibRat id_igRat id_ikRat id_ipRat id_irRat id_fqRat id_ijRat id_iqRat id_ifRat id_ioRat - ObservedRat 
 id_evHost id_bbHost id_cdHost id_cyHost id_bpHost id_biHost id_ckHost id_dtHost id_fjHost id_dfHost id_eaHost id_nHost id_ehHost id_dmHost id_uHost id_eoHost id_gHost id_bwHost id_fcHost id_crHost - ObservedHost 
 id_aDomain - ObservedDomain 
 id_hnFile id_hqFile id_huFile id_hjFile id_hkFile id_hmFile id_hpFile id_hrFile id_hiFile id_hsFile id_hhFile id_hvFile id_hxFile id_hlFile id_hwFile id_hyFile id_hoFile id_hgFile id_hzFile id_htFile - ObservedFile 
 id_cDomainUser - ObservedDomainUser 
 num__141 num__85 num__71 num__51 num__15 num__106 num__44 num__65 num__120 num__8 num__64 num__121 num__107 num__127 num__78 num__79 num__58 num__86 num__92 num__99 num__93 num__134 num__50 num__57 num__114 num__22 num__23 num__36 num__100 num__135 num__113 num__128 num__9 num__142 num__43 num__72 num__30 num__16 num__37 num__29 - num 
 id_dDomainCredential - ObservedDomainCredential 
 id_gnSchtask id_gqSchtask id_gmSchtask id_gzSchtask id_hfSchtask id_gySchtask id_gpSchtask id_haSchtask id_grSchtask id_gwSchtask id_hbSchtask id_gsSchtask id_gtSchtask id_guSchtask id_hcSchtask id_hdSchtask id_goSchtask id_heSchtask id_gxSchtask id_gvSchtask - ObservedSchtask 
)
(:init     (knows id_bpHost)
     (knows id_fqRat)
     (knows_property id_bpHost pfqdn)
     (knows_property id_fqRat pexecutable)
     (knows_property id_fqRat phost)
     (mem_cached_domain_creds id_bbHost id_dDomainCredential)
     (mem_cached_domain_creds id_biHost id_dDomainCredential)
     (mem_cached_domain_creds id_bpHost id_dDomainCredential)
     (mem_cached_domain_creds id_bwHost id_dDomainCredential)
     (mem_cached_domain_creds id_cdHost id_dDomainCredential)
     (mem_cached_domain_creds id_ckHost id_dDomainCredential)
     (mem_cached_domain_creds id_crHost id_dDomainCredential)
     (mem_cached_domain_creds id_cyHost id_dDomainCredential)
     (mem_cached_domain_creds id_dfHost id_dDomainCredential)
     (mem_cached_domain_creds id_dmHost id_dDomainCredential)
     (mem_cached_domain_creds id_dtHost id_dDomainCredential)
     (mem_cached_domain_creds id_eaHost id_dDomainCredential)
     (mem_cached_domain_creds id_ehHost id_dDomainCredential)
     (mem_cached_domain_creds id_eoHost id_dDomainCredential)
     (mem_cached_domain_creds id_evHost id_dDomainCredential)
     (mem_cached_domain_creds id_fcHost id_dDomainCredential)
     (mem_cached_domain_creds id_fjHost id_dDomainCredential)
     (mem_cached_domain_creds id_gHost id_dDomainCredential)
     (mem_cached_domain_creds id_nHost id_dDomainCredential)
     (mem_cached_domain_creds id_uHost id_dDomainCredential)
     (mem_domain_user_admins id_bbHost id_cDomainUser)
     (mem_domain_user_admins id_biHost id_cDomainUser)
     (mem_domain_user_admins id_bpHost id_cDomainUser)
     (mem_domain_user_admins id_bwHost id_cDomainUser)
     (mem_domain_user_admins id_cdHost id_cDomainUser)
     (mem_domain_user_admins id_ckHost id_cDomainUser)
     (mem_domain_user_admins id_crHost id_cDomainUser)
     (mem_domain_user_admins id_cyHost id_cDomainUser)
     (mem_domain_user_admins id_dfHost id_cDomainUser)
     (mem_domain_user_admins id_dmHost id_cDomainUser)
     (mem_domain_user_admins id_dtHost id_cDomainUser)
     (mem_domain_user_admins id_eaHost id_cDomainUser)
     (mem_domain_user_admins id_ehHost id_cDomainUser)
     (mem_domain_user_admins id_eoHost id_cDomainUser)
     (mem_domain_user_admins id_evHost id_cDomainUser)
     (mem_domain_user_admins id_fcHost id_cDomainUser)
     (mem_domain_user_admins id_fjHost id_cDomainUser)
     (mem_domain_user_admins id_gHost id_cDomainUser)
     (mem_domain_user_admins id_nHost id_cDomainUser)
     (mem_domain_user_admins id_uHost id_cDomainUser)
     (mem_hosts id_aDomain id_bbHost)
     (mem_hosts id_aDomain id_biHost)
     (mem_hosts id_aDomain id_bpHost)
     (mem_hosts id_aDomain id_bwHost)
     (mem_hosts id_aDomain id_cdHost)
     (mem_hosts id_aDomain id_ckHost)
     (mem_hosts id_aDomain id_crHost)
     (mem_hosts id_aDomain id_cyHost)
     (mem_hosts id_aDomain id_dfHost)
     (mem_hosts id_aDomain id_dmHost)
     (mem_hosts id_aDomain id_dtHost)
     (mem_hosts id_aDomain id_eaHost)
     (mem_hosts id_aDomain id_ehHost)
     (mem_hosts id_aDomain id_eoHost)
     (mem_hosts id_aDomain id_evHost)
     (mem_hosts id_aDomain id_fcHost)
     (mem_hosts id_aDomain id_fjHost)
     (mem_hosts id_aDomain id_gHost)
     (mem_hosts id_aDomain id_nHost)
     (mem_hosts id_aDomain id_uHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_dc id_bbHost no)
     (prop_dc id_biHost no)
     (prop_dc id_bpHost no)
     (prop_dc id_bwHost no)
     (prop_dc id_cdHost no)
     (prop_dc id_ckHost no)
     (prop_dc id_crHost no)
     (prop_dc id_cyHost no)
     (prop_dc id_dfHost no)
     (prop_dc id_dmHost no)
     (prop_dc id_dtHost no)
     (prop_dc id_eaHost no)
     (prop_dc id_ehHost no)
     (prop_dc id_eoHost no)
     (prop_dc id_evHost yes)
     (prop_dc id_fcHost no)
     (prop_dc id_fjHost no)
     (prop_dc id_gHost yes)
     (prop_dc id_nHost no)
     (prop_dc id_uHost yes)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bbHost str__bh)
     (prop_dns_domain_name id_biHost str__bo)
     (prop_dns_domain_name id_bpHost str__bv)
     (prop_dns_domain_name id_bwHost str__cc)
     (prop_dns_domain_name id_cdHost str__cj)
     (prop_dns_domain_name id_ckHost str__cq)
     (prop_dns_domain_name id_crHost str__cx)
     (prop_dns_domain_name id_cyHost str__de)
     (prop_dns_domain_name id_dfHost str__dl)
     (prop_dns_domain_name id_dmHost str__ds)
     (prop_dns_domain_name id_dtHost str__dz)
     (prop_dns_domain_name id_eaHost str__eg)
     (prop_dns_domain_name id_ehHost str__en)
     (prop_dns_domain_name id_eoHost str__eu)
     (prop_dns_domain_name id_evHost str__fb)
     (prop_dns_domain_name id_fcHost str__fi)
     (prop_dns_domain_name id_fjHost str__fp)
     (prop_dns_domain_name id_gHost str__m)
     (prop_dns_domain_name id_nHost str__t)
     (prop_dns_domain_name id_uHost str__ba)
     (prop_domain id_bbHost id_aDomain)
     (prop_domain id_biHost id_aDomain)
     (prop_domain id_bpHost id_aDomain)
     (prop_domain id_bwHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_cdHost id_aDomain)
     (prop_domain id_ckHost id_aDomain)
     (prop_domain id_crHost id_aDomain)
     (prop_domain id_cyHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_dfHost id_aDomain)
     (prop_domain id_dmHost id_aDomain)
     (prop_domain id_dtHost id_aDomain)
     (prop_domain id_eaHost id_aDomain)
     (prop_domain id_ehHost id_aDomain)
     (prop_domain id_eoHost id_aDomain)
     (prop_domain id_evHost id_aDomain)
     (prop_domain id_fcHost id_aDomain)
     (prop_domain id_fjHost id_aDomain)
     (prop_domain id_gHost id_aDomain)
     (prop_domain id_nHost id_aDomain)
     (prop_domain id_uHost id_aDomain)
     (prop_elevated id_fqRat yes)
     (prop_executable id_fqRat str__fr)
     (prop_fqdn id_bbHost str__bg)
     (prop_fqdn id_biHost str__bn)
     (prop_fqdn id_bpHost str__bu)
     (prop_fqdn id_bwHost str__cb)
     (prop_fqdn id_cdHost str__ci)
     (prop_fqdn id_ckHost str__cp)
     (prop_fqdn id_crHost str__cw)
     (prop_fqdn id_cyHost str__dd)
     (prop_fqdn id_dfHost str__dk)
     (prop_fqdn id_dmHost str__dr)
     (prop_fqdn id_dtHost str__dy)
     (prop_fqdn id_eaHost str__ef)
     (prop_fqdn id_ehHost str__em)
     (prop_fqdn id_eoHost str__et)
     (prop_fqdn id_evHost str__fa)
     (prop_fqdn id_fcHost str__fh)
     (prop_fqdn id_fjHost str__fo)
     (prop_fqdn id_gHost str__l)
     (prop_fqdn id_nHost str__s)
     (prop_fqdn id_uHost str__z)
     (prop_host id_bcTimeDelta id_bbHost)
     (prop_host id_bjTimeDelta id_biHost)
     (prop_host id_bqTimeDelta id_bpHost)
     (prop_host id_bxTimeDelta id_bwHost)
     (prop_host id_ceTimeDelta id_cdHost)
     (prop_host id_clTimeDelta id_ckHost)
     (prop_host id_csTimeDelta id_crHost)
     (prop_host id_czTimeDelta id_cyHost)
     (prop_host id_dgTimeDelta id_dfHost)
     (prop_host id_dnTimeDelta id_dmHost)
     (prop_host id_duTimeDelta id_dtHost)
     (prop_host id_ebTimeDelta id_eaHost)
     (prop_host id_eiTimeDelta id_ehHost)
     (prop_host id_epTimeDelta id_eoHost)
     (prop_host id_ewTimeDelta id_evHost)
     (prop_host id_fdTimeDelta id_fcHost)
     (prop_host id_fkTimeDelta id_fjHost)
     (prop_host id_fqRat id_bpHost)
     (prop_host id_hTimeDelta id_gHost)
     (prop_host id_oTimeDelta id_nHost)
     (prop_host id_vTimeDelta id_uHost)
     (prop_hostname id_bbHost str__bf)
     (prop_hostname id_biHost str__bm)
     (prop_hostname id_bpHost str__bt)
     (prop_hostname id_bwHost str__ca)
     (prop_hostname id_cdHost str__ch)
     (prop_hostname id_ckHost str__co)
     (prop_hostname id_crHost str__cv)
     (prop_hostname id_cyHost str__dc)
     (prop_hostname id_dfHost str__dj)
     (prop_hostname id_dmHost str__dq)
     (prop_hostname id_dtHost str__dx)
     (prop_hostname id_eaHost str__ee)
     (prop_hostname id_ehHost str__el)
     (prop_hostname id_eoHost str__es)
     (prop_hostname id_evHost str__ez)
     (prop_hostname id_fcHost str__fg)
     (prop_hostname id_fjHost str__fn)
     (prop_hostname id_gHost str__k)
     (prop_hostname id_nHost str__r)
     (prop_hostname id_uHost str__y)
     (prop_is_group id_cDomainUser no)
     (prop_microseconds id_bcTimeDelta num__30)
     (prop_microseconds id_bjTimeDelta num__37)
     (prop_microseconds id_bqTimeDelta num__44)
     (prop_microseconds id_bxTimeDelta num__51)
     (prop_microseconds id_ceTimeDelta num__58)
     (prop_microseconds id_clTimeDelta num__65)
     (prop_microseconds id_csTimeDelta num__72)
     (prop_microseconds id_czTimeDelta num__79)
     (prop_microseconds id_dgTimeDelta num__86)
     (prop_microseconds id_dnTimeDelta num__93)
     (prop_microseconds id_duTimeDelta num__100)
     (prop_microseconds id_ebTimeDelta num__107)
     (prop_microseconds id_eiTimeDelta num__114)
     (prop_microseconds id_epTimeDelta num__121)
     (prop_microseconds id_ewTimeDelta num__128)
     (prop_microseconds id_fdTimeDelta num__135)
     (prop_microseconds id_fkTimeDelta num__142)
     (prop_microseconds id_hTimeDelta num__9)
     (prop_microseconds id_oTimeDelta num__16)
     (prop_microseconds id_vTimeDelta num__23)
     (prop_password id_dDomainCredential str__e)
     (prop_seconds id_bcTimeDelta num__29)
     (prop_seconds id_bjTimeDelta num__36)
     (prop_seconds id_bqTimeDelta num__43)
     (prop_seconds id_bxTimeDelta num__50)
     (prop_seconds id_ceTimeDelta num__57)
     (prop_seconds id_clTimeDelta num__64)
     (prop_seconds id_csTimeDelta num__71)
     (prop_seconds id_czTimeDelta num__78)
     (prop_seconds id_dgTimeDelta num__85)
     (prop_seconds id_dnTimeDelta num__92)
     (prop_seconds id_duTimeDelta num__99)
     (prop_seconds id_ebTimeDelta num__106)
     (prop_seconds id_eiTimeDelta num__113)
     (prop_seconds id_epTimeDelta num__120)
     (prop_seconds id_ewTimeDelta num__127)
     (prop_seconds id_fdTimeDelta num__134)
     (prop_seconds id_fkTimeDelta num__141)
     (prop_seconds id_hTimeDelta num__8)
     (prop_seconds id_oTimeDelta num__15)
     (prop_seconds id_vTimeDelta num__22)
     (prop_sid id_cDomainUser str__f)
     (prop_timedelta id_bbHost id_bcTimeDelta)
     (prop_timedelta id_biHost id_bjTimeDelta)
     (prop_timedelta id_bpHost id_bqTimeDelta)
     (prop_timedelta id_bwHost id_bxTimeDelta)
     (prop_timedelta id_cdHost id_ceTimeDelta)
     (prop_timedelta id_ckHost id_clTimeDelta)
     (prop_timedelta id_crHost id_csTimeDelta)
     (prop_timedelta id_cyHost id_czTimeDelta)
     (prop_timedelta id_dfHost id_dgTimeDelta)
     (prop_timedelta id_dmHost id_dnTimeDelta)
     (prop_timedelta id_dtHost id_duTimeDelta)
     (prop_timedelta id_eaHost id_ebTimeDelta)
     (prop_timedelta id_ehHost id_eiTimeDelta)
     (prop_timedelta id_eoHost id_epTimeDelta)
     (prop_timedelta id_evHost id_ewTimeDelta)
     (prop_timedelta id_fcHost id_fdTimeDelta)
     (prop_timedelta id_fjHost id_fkTimeDelta)
     (prop_timedelta id_gHost id_hTimeDelta)
     (prop_timedelta id_nHost id_oTimeDelta)
     (prop_timedelta id_uHost id_vTimeDelta)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_username id_cDomainUser str__james)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_ipRat id_crHost)
     (prop_host id_icRat id_evHost)
     (prop_host id_isRat id_cyHost)
     (prop_host id_imRat id_ckHost)
     (prop_host id_iaRat id_ehHost)
     (prop_host id_ibRat id_uHost)
     (prop_host id_igRat id_eoHost)
     (prop_host id_irRat id_bwHost)
     (prop_host id_ijRat id_bbHost)
     (prop_host id_iqRat id_cdHost)
     (prop_host id_ifRat id_fjHost)
     (prop_host id_ihRat id_biHost)
     (prop_host id_idRat id_gHost)
     (prop_host id_iiRat id_dfHost)
     (prop_host id_itRat id_nHost)
     (prop_host id_ieRat id_dmHost)
     (prop_host id_ilRat id_dtHost)
     (prop_host id_ioRat id_eaHost)
     (prop_host id_ikRat id_fcHost)
)
)
)