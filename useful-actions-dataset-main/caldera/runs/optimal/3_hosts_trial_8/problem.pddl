;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 3 hosts, 14 user, 5 admin per host, 5 active account per host
(define (problem gen)
(:domain caldera)
(:objects id_aDomain - ObservedDomain 
 num__61 num__74 num__67 num__75 num__60 num__68 - num 
 id_coTimeDelta id_cvTimeDelta id_chTimeDelta - ObservedTimeDelta 
 id_biDomainUser id_wDomainUser id_byDomainUser id_oDomainUser id_beDomainUser id_bqDomainUser id_cDomainUser id_ccDomainUser id_bmDomainUser id_sDomainUser id_gDomainUser id_buDomainUser id_kDomainUser id_baDomainUser - ObservedDomainUser 
 id_doSchtask id_dnSchtask id_dmSchtask - ObservedSchtask 
 id_ddFile id_deFile id_dfFile - ObservedFile 
 id_cuHost id_cgHost id_cnHost - ObservedHost 
 id_tDomainCredential id_brDomainCredential id_bzDomainCredential id_lDomainCredential id_dDomainCredential id_bbDomainCredential id_bfDomainCredential id_xDomainCredential id_pDomainCredential id_bvDomainCredential id_bjDomainCredential id_hDomainCredential id_bnDomainCredential id_cdDomainCredential - ObservedDomainCredential 
 id_dkRat id_dlRat id_djRat id_dbRat - ObservedRat 
 id_dgShare id_diShare id_dhShare - ObservedShare 
 str__y str__ca str__u str__cr str__bd str__bx str__z str__f str__cy str__bt str__bo str__bl str__da str__bp str__mary str__b str__cb str__alpha str__cm str__i str__j str__ct str__v str__bw str__cl str__robert str__dc str__william str__bg str__bk str__r str__james str__michael str__n str__barbara str__e str__bs str__patricia str__richard str__m str__ce str__cs str__david str__cf str__jennifer str__bh str__q str__cz str__bc str__elizabeth str__ck str__maria str__john str__linda - string 
)
(:init     (knows id_cuHost)
     (knows id_dbRat)
     (knows_property id_cuHost pfqdn)
     (knows_property id_dbRat pexecutable)
     (knows_property id_dbRat phost)
     (mem_cached_domain_creds id_cgHost id_bbDomainCredential)
     (mem_cached_domain_creds id_cgHost id_brDomainCredential)
     (mem_cached_domain_creds id_cgHost id_bvDomainCredential)
     (mem_cached_domain_creds id_cgHost id_bzDomainCredential)
     (mem_cached_domain_creds id_cgHost id_cdDomainCredential)
     (mem_cached_domain_creds id_cnHost id_bfDomainCredential)
     (mem_cached_domain_creds id_cnHost id_bnDomainCredential)
     (mem_cached_domain_creds id_cnHost id_brDomainCredential)
     (mem_cached_domain_creds id_cnHost id_tDomainCredential)
     (mem_cached_domain_creds id_cnHost id_xDomainCredential)
     (mem_cached_domain_creds id_cuHost id_bjDomainCredential)
     (mem_cached_domain_creds id_cuHost id_bnDomainCredential)
     (mem_cached_domain_creds id_cuHost id_brDomainCredential)
     (mem_cached_domain_creds id_cuHost id_bzDomainCredential)
     (mem_cached_domain_creds id_cuHost id_cdDomainCredential)
     (mem_domain_user_admins id_cgHost id_bmDomainUser)
     (mem_domain_user_admins id_cgHost id_bqDomainUser)
     (mem_domain_user_admins id_cgHost id_byDomainUser)
     (mem_domain_user_admins id_cgHost id_kDomainUser)
     (mem_domain_user_admins id_cgHost id_wDomainUser)
     (mem_domain_user_admins id_cnHost id_baDomainUser)
     (mem_domain_user_admins id_cnHost id_beDomainUser)
     (mem_domain_user_admins id_cnHost id_kDomainUser)
     (mem_domain_user_admins id_cnHost id_sDomainUser)
     (mem_domain_user_admins id_cnHost id_wDomainUser)
     (mem_domain_user_admins id_cuHost id_baDomainUser)
     (mem_domain_user_admins id_cuHost id_cDomainUser)
     (mem_domain_user_admins id_cuHost id_ccDomainUser)
     (mem_domain_user_admins id_cuHost id_kDomainUser)
     (mem_domain_user_admins id_cuHost id_wDomainUser)
     (mem_hosts id_aDomain id_cgHost)
     (mem_hosts id_aDomain id_cnHost)
     (mem_hosts id_aDomain id_cuHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_bqDomainUser id_brDomainCredential)
     (prop_cred id_buDomainUser id_bvDomainCredential)
     (prop_cred id_byDomainUser id_bzDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_ccDomainUser id_cdDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_cgHost no)
     (prop_dc id_cnHost no)
     (prop_dc id_cuHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_cgHost str__cm)
     (prop_dns_domain_name id_cnHost str__ct)
     (prop_dns_domain_name id_cuHost str__da)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biDomainUser id_aDomain)
     (prop_domain id_bjDomainCredential id_aDomain)
     (prop_domain id_bmDomainUser id_aDomain)
     (prop_domain id_bnDomainCredential id_aDomain)
     (prop_domain id_bqDomainUser id_aDomain)
     (prop_domain id_brDomainCredential id_aDomain)
     (prop_domain id_buDomainUser id_aDomain)
     (prop_domain id_bvDomainCredential id_aDomain)
     (prop_domain id_byDomainUser id_aDomain)
     (prop_domain id_bzDomainCredential id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_ccDomainUser id_aDomain)
     (prop_domain id_cdDomainCredential id_aDomain)
     (prop_domain id_cgHost id_aDomain)
     (prop_domain id_cnHost id_aDomain)
     (prop_domain id_cuHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_dbRat yes)
     (prop_executable id_dbRat str__dc)
     (prop_fqdn id_cgHost str__ck)
     (prop_fqdn id_cnHost str__cr)
     (prop_fqdn id_cuHost str__cy)
     (prop_host id_chTimeDelta id_cgHost)
     (prop_host id_coTimeDelta id_cnHost)
     (prop_host id_cvTimeDelta id_cuHost)
     (prop_host id_dbRat id_cuHost)
     (prop_hostname id_cgHost str__cl)
     (prop_hostname id_cnHost str__cs)
     (prop_hostname id_cuHost str__cz)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_bqDomainUser no)
     (prop_is_group id_buDomainUser no)
     (prop_is_group id_byDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_ccDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_chTimeDelta num__61)
     (prop_microseconds id_coTimeDelta num__68)
     (prop_microseconds id_cvTimeDelta num__75)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_brDomainCredential str__bs)
     (prop_password id_bvDomainCredential str__bw)
     (prop_password id_bzDomainCredential str__ca)
     (prop_password id_cdDomainCredential str__ce)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_chTimeDelta num__60)
     (prop_seconds id_coTimeDelta num__67)
     (prop_seconds id_cvTimeDelta num__74)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_bqDomainUser str__bt)
     (prop_sid id_buDomainUser str__bx)
     (prop_sid id_byDomainUser str__cb)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_ccDomainUser str__cf)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_cgHost id_chTimeDelta)
     (prop_timedelta id_cnHost id_coTimeDelta)
     (prop_timedelta id_cuHost id_cvTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
     (prop_user id_brDomainCredential id_bqDomainUser)
     (prop_user id_bvDomainCredential id_buDomainUser)
     (prop_user id_bzDomainCredential id_byDomainUser)
     (prop_user id_cdDomainCredential id_ccDomainUser)
     (prop_user id_dDomainCredential id_cDomainUser)
     (prop_user id_hDomainCredential id_gDomainUser)
     (prop_user id_lDomainCredential id_kDomainUser)
     (prop_user id_pDomainCredential id_oDomainUser)
     (prop_user id_tDomainCredential id_sDomainUser)
     (prop_user id_xDomainCredential id_wDomainUser)
     (prop_username id_baDomainUser str__michael)
     (prop_username id_beDomainUser str__barbara)
     (prop_username id_biDomainUser str__william)
     (prop_username id_bmDomainUser str__elizabeth)
     (prop_username id_bqDomainUser str__david)
     (prop_username id_buDomainUser str__jennifer)
     (prop_username id_byDomainUser str__richard)
     (prop_username id_cDomainUser str__james)
     (prop_username id_ccDomainUser str__maria)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_djRat id_cnHost)
     (prop_host id_dkRat id_cgHost)
)
)
)