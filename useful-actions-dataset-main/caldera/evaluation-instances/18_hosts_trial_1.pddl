;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 18 hosts, 1 user, 1 admin per host, 1 active account per host
(define (problem p18_hosts_trial_1)
(:domain caldera)
(:objects id_hkRat id_hwRat id_hrRat id_huRat id_hsRat id_hvRat id_fcRat id_hpRat id_htRat id_hmRat id_hjRat id_hnRat id_hqRat id_hhRat id_hgRat id_hlRat id_hoRat id_hxRat id_hiRat - ObservedRat 
 id_gwShare id_grShare id_gxShare id_hdShare id_haShare id_gvShare id_hfShare id_gtShare id_gpShare id_goShare id_heShare id_guShare id_gyShare id_hcShare id_gqShare id_gsShare id_gzShare id_hbShare - ObservedShare 
 id_ehHost id_eaHost id_evHost id_ckHost id_gHost id_bbHost id_cdHost id_crHost id_dmHost id_cyHost id_eoHost id_bpHost id_dtHost id_dfHost id_nHost id_uHost id_bwHost id_biHost - ObservedHost 
 id_czTimeDelta id_ebTimeDelta id_dgTimeDelta id_bcTimeDelta id_bqTimeDelta id_bjTimeDelta id_ewTimeDelta id_clTimeDelta id_hTimeDelta id_csTimeDelta id_epTimeDelta id_oTimeDelta id_duTimeDelta id_eiTimeDelta id_dnTimeDelta id_bxTimeDelta id_vTimeDelta id_ceTimeDelta - ObservedTimeDelta 
 id_aDomain - ObservedDomain 
 str__eu str__bf str__ci str__ef str__bt str__dz str__cv str__cx str__cw str__ds str__en str__es str__fa str__cb str__bn str__dj str__dk str__y str__bv str__b str__et str__cq str__m str__ch str__dd str__dq str__fb str__james str__de str__dc str__el str__cj str__z str__bu str__ca str__alpha str__dy str__fd str__co str__dx str__e str__bg str__cc str__em str__f str__ee str__k str__dr str__ez str__t str__bm str__ba str__s str__dl str__bo str__eg str__l str__cp str__r str__bh - string 
 id_dDomainCredential - ObservedDomainCredential 
 id_cDomainUser - ObservedDomainUser 
 id_ghFile id_glFile id_gkFile id_ggFile id_gdFile id_fyFile id_gjFile id_gaFile id_gnFile id_gfFile id_gmFile id_giFile id_fzFile id_fwFile id_fxFile id_gcFile id_geFile id_gbFile - ObservedFile 
 id_ftSchtask id_ffSchtask id_fkSchtask id_flSchtask id_fpSchtask id_fmSchtask id_fqSchtask id_fgSchtask id_fiSchtask id_fhSchtask id_frSchtask id_foSchtask id_fsSchtask id_fnSchtask id_fjSchtask id_fuSchtask id_fvSchtask id_feSchtask - ObservedSchtask 
 num__37 num__58 num__64 num__113 num__9 num__16 num__100 num__114 num__44 num__57 num__43 num__128 num__71 num__72 num__99 num__30 num__36 num__86 num__29 num__15 num__92 num__79 num__8 num__23 num__93 num__121 num__127 num__107 num__120 num__50 num__106 num__22 num__85 num__78 num__65 num__51 - num 
)
(:init     (knows id_cyHost)
     (knows id_fcRat)
     (knows_property id_cyHost pfqdn)
     (knows_property id_fcRat pexecutable)
     (knows_property id_fcRat phost)
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
     (mem_hosts id_aDomain id_gHost)
     (mem_hosts id_aDomain id_nHost)
     (mem_hosts id_aDomain id_uHost)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_dc id_bbHost no)
     (prop_dc id_biHost no)
     (prop_dc id_bpHost no)
     (prop_dc id_bwHost no)
     (prop_dc id_cdHost yes)
     (prop_dc id_ckHost no)
     (prop_dc id_crHost yes)
     (prop_dc id_cyHost no)
     (prop_dc id_dfHost no)
     (prop_dc id_dmHost no)
     (prop_dc id_dtHost no)
     (prop_dc id_eaHost no)
     (prop_dc id_ehHost no)
     (prop_dc id_eoHost no)
     (prop_dc id_evHost no)
     (prop_dc id_gHost yes)
     (prop_dc id_nHost yes)
     (prop_dc id_uHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bbHost str__bf)
     (prop_dns_domain_name id_biHost str__bm)
     (prop_dns_domain_name id_bpHost str__bt)
     (prop_dns_domain_name id_bwHost str__ca)
     (prop_dns_domain_name id_cdHost str__ch)
     (prop_dns_domain_name id_ckHost str__co)
     (prop_dns_domain_name id_crHost str__cv)
     (prop_dns_domain_name id_cyHost str__dc)
     (prop_dns_domain_name id_dfHost str__dj)
     (prop_dns_domain_name id_dmHost str__dq)
     (prop_dns_domain_name id_dtHost str__dx)
     (prop_dns_domain_name id_eaHost str__ee)
     (prop_dns_domain_name id_ehHost str__el)
     (prop_dns_domain_name id_eoHost str__es)
     (prop_dns_domain_name id_evHost str__ez)
     (prop_dns_domain_name id_gHost str__k)
     (prop_dns_domain_name id_nHost str__r)
     (prop_dns_domain_name id_uHost str__y)
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
     (prop_domain id_gHost id_aDomain)
     (prop_domain id_nHost id_aDomain)
     (prop_domain id_uHost id_aDomain)
     (prop_elevated id_fcRat yes)
     (prop_executable id_fcRat str__fd)
     (prop_fqdn id_bbHost str__bh)
     (prop_fqdn id_biHost str__bo)
     (prop_fqdn id_bpHost str__bv)
     (prop_fqdn id_bwHost str__cc)
     (prop_fqdn id_cdHost str__cj)
     (prop_fqdn id_ckHost str__cq)
     (prop_fqdn id_crHost str__cx)
     (prop_fqdn id_cyHost str__de)
     (prop_fqdn id_dfHost str__dl)
     (prop_fqdn id_dmHost str__ds)
     (prop_fqdn id_dtHost str__dz)
     (prop_fqdn id_eaHost str__eg)
     (prop_fqdn id_ehHost str__en)
     (prop_fqdn id_eoHost str__eu)
     (prop_fqdn id_evHost str__fb)
     (prop_fqdn id_gHost str__m)
     (prop_fqdn id_nHost str__t)
     (prop_fqdn id_uHost str__ba)
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
     (prop_host id_fcRat id_cyHost)
     (prop_host id_hTimeDelta id_gHost)
     (prop_host id_oTimeDelta id_nHost)
     (prop_host id_vTimeDelta id_uHost)
     (prop_hostname id_bbHost str__bg)
     (prop_hostname id_biHost str__bn)
     (prop_hostname id_bpHost str__bu)
     (prop_hostname id_bwHost str__cb)
     (prop_hostname id_cdHost str__ci)
     (prop_hostname id_ckHost str__cp)
     (prop_hostname id_crHost str__cw)
     (prop_hostname id_cyHost str__dd)
     (prop_hostname id_dfHost str__dk)
     (prop_hostname id_dmHost str__dr)
     (prop_hostname id_dtHost str__dy)
     (prop_hostname id_eaHost str__ef)
     (prop_hostname id_ehHost str__em)
     (prop_hostname id_eoHost str__et)
     (prop_hostname id_evHost str__fa)
     (prop_hostname id_gHost str__l)
     (prop_hostname id_nHost str__s)
     (prop_hostname id_uHost str__z)
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
     (prop_timedelta id_gHost id_hTimeDelta)
     (prop_timedelta id_nHost id_oTimeDelta)
     (prop_timedelta id_uHost id_vTimeDelta)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_username id_cDomainUser str__james)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_hxRat id_nHost)
     (prop_host id_hrRat id_ehHost)
     (prop_host id_hvRat id_eaHost)
     (prop_host id_htRat id_ckHost)
     (prop_host id_hnRat id_cdHost)
     (prop_host id_hqRat id_eoHost)
     (prop_host id_hsRat id_bpHost)
     (prop_host id_hiRat id_uHost)
     (prop_host id_hkRat id_bwHost)
     (prop_host id_hwRat id_biHost)
     (prop_host id_huRat id_evHost)
     (prop_host id_hpRat id_gHost)
     (prop_host id_hmRat id_bbHost)
     (prop_host id_hjRat id_crHost)
     (prop_host id_hhRat id_dmHost)
     (prop_host id_hgRat id_dtHost)
     (prop_host id_hlRat id_dfHost)
)
)
)