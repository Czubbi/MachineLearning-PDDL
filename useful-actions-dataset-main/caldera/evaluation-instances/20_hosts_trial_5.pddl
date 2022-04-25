;Copyright 2018 The MITRE Corporation. All rights reserved. Approved for public release. Distribution unlimited 17-2122.
; For more information on CALDERA, the automated adversary emulation system, visit https://github.com/mitre/caldera or email attack@mitre.org
; This has 20 hosts, 10 user, 2 admin per host, 2 active account per host
(define (problem p20_hosts_trial_5)
(:domain caldera)
(:objects id_dhTimeDelta id_dvTimeDelta id_exTimeDelta id_cfTimeDelta id_brTimeDelta id_feTimeDelta id_eqTimeDelta id_fzTimeDelta id_ggTimeDelta id_guTimeDelta id_cmTimeDelta id_byTimeDelta id_fsTimeDelta id_daTimeDelta id_gnTimeDelta id_flTimeDelta id_doTimeDelta id_ecTimeDelta id_ctTimeDelta id_ejTimeDelta - ObservedTimeDelta 
 id_hrFile id_hmFile id_hkFile id_hoFile id_huFile id_hnFile id_hgFile id_hsFile id_hlFile id_hfFile id_hcFile id_hpFile id_hqFile id_htFile id_heFile id_hvFile id_hhFile id_hdFile id_hjFile id_hiFile - ObservedFile 
 id_aDomain - ObservedDomain 
 id_bnDomainCredential id_dDomainCredential id_lDomainCredential id_bbDomainCredential id_pDomainCredential id_bjDomainCredential id_tDomainCredential id_bfDomainCredential id_xDomainCredential id_hDomainCredential - ObservedDomainCredential 
 id_jpRat id_jrRat id_jxRat id_jmRat id_juRat id_kcRat id_jwRat id_jnRat id_jkRat id_jvRat id_jzRat id_jlRat id_joRat id_jyRat id_kbRat id_jtRat id_kdRat id_kaRat id_jqRat id_jsRat id_haRat - ObservedRat 
 id_clHost id_dnHost id_epHost id_fdHost id_gtHost id_fkHost id_frHost id_czHost id_csHost id_ebHost id_fyHost id_ceHost id_eiHost id_gfHost id_duHost id_bxHost id_ewHost id_gmHost id_dgHost id_bqHost - ObservedHost 
 num__73 num__93 num__171 num__45 num__66 num__136 num__170 num__143 num__157 num__108 num__135 num__65 num__164 num__122 num__72 num__128 num__115 num__100 num__107 num__129 num__114 num__163 num__177 num__79 num__156 num__121 num__142 num__94 num__150 num__86 num__149 num__87 num__59 num__80 num__178 num__101 num__58 num__52 num__44 num__51 - num 
 str__bp str__ci str__fq str__n str__cc str__dy str__i str__u str__william str__barbara str__b str__bd str__fo str__dd str__de str__dt str__bh str__dk str__cx str__gr str__em str__bk str__fj str__f str__cj str__hb str__fp str__cp str__cr str__linda str__gd str__patricia str__bv str__ea str__gj str__y str__eg str__elizabeth str__q str__fb str__v str__cd str__fi str__bw str__fx str__ck str__j str__gc str__gs str__bu str__michael str__et str__robert str__m str__alpha str__gq str__cy str__gy str__bc str__bl str__eu str__fh str__gx str__e str__fa str__eh str__gz str__cq str__dz str__john str__en str__eo str__dm str__bo str__df str__dl str__ge str__cb str__r str__dr str__bg str__z str__fv str__gk str__cw str__ef str__mary str__ev str__fw str__gl str__ds str__fc str__james - string 
 id_ibSchtask id_icSchtask id_ieSchtask id_hxSchtask id_ikSchtask id_ihSchtask id_hwSchtask id_hySchtask id_igSchtask id_inSchtask id_iiSchtask id_ioSchtask id_ipSchtask id_ilSchtask id_idSchtask id_ijSchtask id_imSchtask id_iaSchtask id_ifSchtask id_hzSchtask - ObservedSchtask 
 id_iwShare id_jdShare id_jfShare id_iqShare id_jhShare id_jiShare id_isShare id_iuShare id_itShare id_ixShare id_jaShare id_jeShare id_jjShare id_ivShare id_izShare id_irShare id_jcShare id_jgShare id_iyShare id_jbShare - ObservedShare 
 id_wDomainUser id_biDomainUser id_kDomainUser id_oDomainUser id_beDomainUser id_baDomainUser id_bmDomainUser id_cDomainUser id_sDomainUser id_gDomainUser - ObservedDomainUser 
)
(:init     (knows id_fyHost)
     (knows id_haRat)
     (knows_property id_fyHost pfqdn)
     (knows_property id_haRat pexecutable)
     (knows_property id_haRat phost)
     (mem_cached_domain_creds id_bqHost id_bbDomainCredential)
     (mem_cached_domain_creds id_bqHost id_bnDomainCredential)
     (mem_cached_domain_creds id_bxHost id_bjDomainCredential)
     (mem_cached_domain_creds id_bxHost id_pDomainCredential)
     (mem_cached_domain_creds id_ceHost id_lDomainCredential)
     (mem_cached_domain_creds id_ceHost id_xDomainCredential)
     (mem_cached_domain_creds id_clHost id_bfDomainCredential)
     (mem_cached_domain_creds id_clHost id_pDomainCredential)
     (mem_cached_domain_creds id_csHost id_bbDomainCredential)
     (mem_cached_domain_creds id_csHost id_hDomainCredential)
     (mem_cached_domain_creds id_czHost id_bfDomainCredential)
     (mem_cached_domain_creds id_czHost id_pDomainCredential)
     (mem_cached_domain_creds id_dgHost id_bnDomainCredential)
     (mem_cached_domain_creds id_dgHost id_pDomainCredential)
     (mem_cached_domain_creds id_dnHost id_bnDomainCredential)
     (mem_cached_domain_creds id_dnHost id_pDomainCredential)
     (mem_cached_domain_creds id_duHost id_bbDomainCredential)
     (mem_cached_domain_creds id_duHost id_bnDomainCredential)
     (mem_cached_domain_creds id_ebHost id_bbDomainCredential)
     (mem_cached_domain_creds id_ebHost id_bnDomainCredential)
     (mem_cached_domain_creds id_eiHost id_bfDomainCredential)
     (mem_cached_domain_creds id_eiHost id_bnDomainCredential)
     (mem_cached_domain_creds id_epHost id_hDomainCredential)
     (mem_cached_domain_creds id_epHost id_xDomainCredential)
     (mem_cached_domain_creds id_ewHost id_bbDomainCredential)
     (mem_cached_domain_creds id_ewHost id_bjDomainCredential)
     (mem_cached_domain_creds id_fdHost id_hDomainCredential)
     (mem_cached_domain_creds id_fdHost id_pDomainCredential)
     (mem_cached_domain_creds id_fkHost id_lDomainCredential)
     (mem_cached_domain_creds id_fkHost id_pDomainCredential)
     (mem_cached_domain_creds id_frHost id_tDomainCredential)
     (mem_cached_domain_creds id_frHost id_xDomainCredential)
     (mem_cached_domain_creds id_fyHost id_bnDomainCredential)
     (mem_cached_domain_creds id_fyHost id_lDomainCredential)
     (mem_cached_domain_creds id_gfHost id_hDomainCredential)
     (mem_cached_domain_creds id_gfHost id_lDomainCredential)
     (mem_cached_domain_creds id_gmHost id_bfDomainCredential)
     (mem_cached_domain_creds id_gmHost id_pDomainCredential)
     (mem_cached_domain_creds id_gtHost id_bfDomainCredential)
     (mem_cached_domain_creds id_gtHost id_xDomainCredential)
     (mem_domain_user_admins id_bqHost id_beDomainUser)
     (mem_domain_user_admins id_bqHost id_bmDomainUser)
     (mem_domain_user_admins id_bxHost id_cDomainUser)
     (mem_domain_user_admins id_bxHost id_oDomainUser)
     (mem_domain_user_admins id_ceHost id_baDomainUser)
     (mem_domain_user_admins id_ceHost id_beDomainUser)
     (mem_domain_user_admins id_clHost id_biDomainUser)
     (mem_domain_user_admins id_clHost id_bmDomainUser)
     (mem_domain_user_admins id_csHost id_gDomainUser)
     (mem_domain_user_admins id_csHost id_oDomainUser)
     (mem_domain_user_admins id_czHost id_bmDomainUser)
     (mem_domain_user_admins id_czHost id_oDomainUser)
     (mem_domain_user_admins id_dgHost id_biDomainUser)
     (mem_domain_user_admins id_dgHost id_wDomainUser)
     (mem_domain_user_admins id_dnHost id_beDomainUser)
     (mem_domain_user_admins id_dnHost id_oDomainUser)
     (mem_domain_user_admins id_duHost id_bmDomainUser)
     (mem_domain_user_admins id_duHost id_oDomainUser)
     (mem_domain_user_admins id_ebHost id_beDomainUser)
     (mem_domain_user_admins id_ebHost id_bmDomainUser)
     (mem_domain_user_admins id_eiHost id_gDomainUser)
     (mem_domain_user_admins id_eiHost id_sDomainUser)
     (mem_domain_user_admins id_epHost id_cDomainUser)
     (mem_domain_user_admins id_epHost id_kDomainUser)
     (mem_domain_user_admins id_ewHost id_biDomainUser)
     (mem_domain_user_admins id_ewHost id_cDomainUser)
     (mem_domain_user_admins id_fdHost id_beDomainUser)
     (mem_domain_user_admins id_fdHost id_wDomainUser)
     (mem_domain_user_admins id_fkHost id_beDomainUser)
     (mem_domain_user_admins id_fkHost id_biDomainUser)
     (mem_domain_user_admins id_frHost id_bmDomainUser)
     (mem_domain_user_admins id_frHost id_kDomainUser)
     (mem_domain_user_admins id_fyHost id_oDomainUser)
     (mem_domain_user_admins id_fyHost id_wDomainUser)
     (mem_domain_user_admins id_gfHost id_biDomainUser)
     (mem_domain_user_admins id_gfHost id_gDomainUser)
     (mem_domain_user_admins id_gmHost id_baDomainUser)
     (mem_domain_user_admins id_gmHost id_biDomainUser)
     (mem_domain_user_admins id_gtHost id_beDomainUser)
     (mem_domain_user_admins id_gtHost id_gDomainUser)
     (mem_hosts id_aDomain id_bqHost)
     (mem_hosts id_aDomain id_bxHost)
     (mem_hosts id_aDomain id_ceHost)
     (mem_hosts id_aDomain id_clHost)
     (mem_hosts id_aDomain id_csHost)
     (mem_hosts id_aDomain id_czHost)
     (mem_hosts id_aDomain id_dgHost)
     (mem_hosts id_aDomain id_dnHost)
     (mem_hosts id_aDomain id_duHost)
     (mem_hosts id_aDomain id_ebHost)
     (mem_hosts id_aDomain id_eiHost)
     (mem_hosts id_aDomain id_epHost)
     (mem_hosts id_aDomain id_ewHost)
     (mem_hosts id_aDomain id_fdHost)
     (mem_hosts id_aDomain id_fkHost)
     (mem_hosts id_aDomain id_frHost)
     (mem_hosts id_aDomain id_fyHost)
     (mem_hosts id_aDomain id_gfHost)
     (mem_hosts id_aDomain id_gmHost)
     (mem_hosts id_aDomain id_gtHost)
     (prop_cred id_baDomainUser id_bbDomainCredential)
     (prop_cred id_beDomainUser id_bfDomainCredential)
     (prop_cred id_biDomainUser id_bjDomainCredential)
     (prop_cred id_bmDomainUser id_bnDomainCredential)
     (prop_cred id_cDomainUser id_dDomainCredential)
     (prop_cred id_gDomainUser id_hDomainCredential)
     (prop_cred id_kDomainUser id_lDomainCredential)
     (prop_cred id_oDomainUser id_pDomainCredential)
     (prop_cred id_sDomainUser id_tDomainCredential)
     (prop_cred id_wDomainUser id_xDomainCredential)
     (prop_dc id_bqHost no)
     (prop_dc id_bxHost yes)
     (prop_dc id_ceHost yes)
     (prop_dc id_clHost no)
     (prop_dc id_csHost no)
     (prop_dc id_czHost no)
     (prop_dc id_dgHost no)
     (prop_dc id_dnHost no)
     (prop_dc id_duHost no)
     (prop_dc id_ebHost no)
     (prop_dc id_eiHost no)
     (prop_dc id_epHost no)
     (prop_dc id_ewHost no)
     (prop_dc id_fdHost yes)
     (prop_dc id_fkHost no)
     (prop_dc id_frHost no)
     (prop_dc id_fyHost no)
     (prop_dc id_gfHost no)
     (prop_dc id_gmHost no)
     (prop_dc id_gtHost no)
     (prop_dns_domain id_aDomain str__b)
     (prop_dns_domain_name id_bqHost str__bu)
     (prop_dns_domain_name id_bxHost str__cb)
     (prop_dns_domain_name id_ceHost str__ci)
     (prop_dns_domain_name id_clHost str__cp)
     (prop_dns_domain_name id_csHost str__cw)
     (prop_dns_domain_name id_czHost str__dd)
     (prop_dns_domain_name id_dgHost str__dk)
     (prop_dns_domain_name id_dnHost str__dr)
     (prop_dns_domain_name id_duHost str__dy)
     (prop_dns_domain_name id_ebHost str__ef)
     (prop_dns_domain_name id_eiHost str__em)
     (prop_dns_domain_name id_epHost str__et)
     (prop_dns_domain_name id_ewHost str__fa)
     (prop_dns_domain_name id_fdHost str__fh)
     (prop_dns_domain_name id_fkHost str__fo)
     (prop_dns_domain_name id_frHost str__fv)
     (prop_dns_domain_name id_fyHost str__gc)
     (prop_dns_domain_name id_gfHost str__gj)
     (prop_dns_domain_name id_gmHost str__gq)
     (prop_dns_domain_name id_gtHost str__gx)
     (prop_domain id_baDomainUser id_aDomain)
     (prop_domain id_bbDomainCredential id_aDomain)
     (prop_domain id_beDomainUser id_aDomain)
     (prop_domain id_bfDomainCredential id_aDomain)
     (prop_domain id_biDomainUser id_aDomain)
     (prop_domain id_bjDomainCredential id_aDomain)
     (prop_domain id_bmDomainUser id_aDomain)
     (prop_domain id_bnDomainCredential id_aDomain)
     (prop_domain id_bqHost id_aDomain)
     (prop_domain id_bxHost id_aDomain)
     (prop_domain id_cDomainUser id_aDomain)
     (prop_domain id_ceHost id_aDomain)
     (prop_domain id_clHost id_aDomain)
     (prop_domain id_csHost id_aDomain)
     (prop_domain id_czHost id_aDomain)
     (prop_domain id_dDomainCredential id_aDomain)
     (prop_domain id_dgHost id_aDomain)
     (prop_domain id_dnHost id_aDomain)
     (prop_domain id_duHost id_aDomain)
     (prop_domain id_ebHost id_aDomain)
     (prop_domain id_eiHost id_aDomain)
     (prop_domain id_epHost id_aDomain)
     (prop_domain id_ewHost id_aDomain)
     (prop_domain id_fdHost id_aDomain)
     (prop_domain id_fkHost id_aDomain)
     (prop_domain id_frHost id_aDomain)
     (prop_domain id_fyHost id_aDomain)
     (prop_domain id_gDomainUser id_aDomain)
     (prop_domain id_gfHost id_aDomain)
     (prop_domain id_gmHost id_aDomain)
     (prop_domain id_gtHost id_aDomain)
     (prop_domain id_hDomainCredential id_aDomain)
     (prop_domain id_kDomainUser id_aDomain)
     (prop_domain id_lDomainCredential id_aDomain)
     (prop_domain id_oDomainUser id_aDomain)
     (prop_domain id_pDomainCredential id_aDomain)
     (prop_domain id_sDomainUser id_aDomain)
     (prop_domain id_tDomainCredential id_aDomain)
     (prop_domain id_wDomainUser id_aDomain)
     (prop_domain id_xDomainCredential id_aDomain)
     (prop_elevated id_haRat yes)
     (prop_executable id_haRat str__hb)
     (prop_fqdn id_bqHost str__bv)
     (prop_fqdn id_bxHost str__cc)
     (prop_fqdn id_ceHost str__cj)
     (prop_fqdn id_clHost str__cq)
     (prop_fqdn id_csHost str__cx)
     (prop_fqdn id_czHost str__de)
     (prop_fqdn id_dgHost str__dl)
     (prop_fqdn id_dnHost str__ds)
     (prop_fqdn id_duHost str__dz)
     (prop_fqdn id_ebHost str__eg)
     (prop_fqdn id_eiHost str__en)
     (prop_fqdn id_epHost str__eu)
     (prop_fqdn id_ewHost str__fb)
     (prop_fqdn id_fdHost str__fi)
     (prop_fqdn id_fkHost str__fp)
     (prop_fqdn id_frHost str__fw)
     (prop_fqdn id_fyHost str__gd)
     (prop_fqdn id_gfHost str__gk)
     (prop_fqdn id_gmHost str__gr)
     (prop_fqdn id_gtHost str__gy)
     (prop_host id_brTimeDelta id_bqHost)
     (prop_host id_byTimeDelta id_bxHost)
     (prop_host id_cfTimeDelta id_ceHost)
     (prop_host id_cmTimeDelta id_clHost)
     (prop_host id_ctTimeDelta id_csHost)
     (prop_host id_daTimeDelta id_czHost)
     (prop_host id_dhTimeDelta id_dgHost)
     (prop_host id_doTimeDelta id_dnHost)
     (prop_host id_dvTimeDelta id_duHost)
     (prop_host id_ecTimeDelta id_ebHost)
     (prop_host id_ejTimeDelta id_eiHost)
     (prop_host id_eqTimeDelta id_epHost)
     (prop_host id_exTimeDelta id_ewHost)
     (prop_host id_feTimeDelta id_fdHost)
     (prop_host id_flTimeDelta id_fkHost)
     (prop_host id_fsTimeDelta id_frHost)
     (prop_host id_fzTimeDelta id_fyHost)
     (prop_host id_ggTimeDelta id_gfHost)
     (prop_host id_gnTimeDelta id_gmHost)
     (prop_host id_guTimeDelta id_gtHost)
     (prop_host id_haRat id_fyHost)
     (prop_hostname id_bqHost str__bw)
     (prop_hostname id_bxHost str__cd)
     (prop_hostname id_ceHost str__ck)
     (prop_hostname id_clHost str__cr)
     (prop_hostname id_csHost str__cy)
     (prop_hostname id_czHost str__df)
     (prop_hostname id_dgHost str__dm)
     (prop_hostname id_dnHost str__dt)
     (prop_hostname id_duHost str__ea)
     (prop_hostname id_ebHost str__eh)
     (prop_hostname id_eiHost str__eo)
     (prop_hostname id_epHost str__ev)
     (prop_hostname id_ewHost str__fc)
     (prop_hostname id_fdHost str__fj)
     (prop_hostname id_fkHost str__fq)
     (prop_hostname id_frHost str__fx)
     (prop_hostname id_fyHost str__ge)
     (prop_hostname id_gfHost str__gl)
     (prop_hostname id_gmHost str__gs)
     (prop_hostname id_gtHost str__gz)
     (prop_is_group id_baDomainUser no)
     (prop_is_group id_beDomainUser no)
     (prop_is_group id_biDomainUser no)
     (prop_is_group id_bmDomainUser no)
     (prop_is_group id_cDomainUser no)
     (prop_is_group id_gDomainUser no)
     (prop_is_group id_kDomainUser no)
     (prop_is_group id_oDomainUser no)
     (prop_is_group id_sDomainUser no)
     (prop_is_group id_wDomainUser no)
     (prop_microseconds id_brTimeDelta num__45)
     (prop_microseconds id_byTimeDelta num__52)
     (prop_microseconds id_cfTimeDelta num__59)
     (prop_microseconds id_cmTimeDelta num__66)
     (prop_microseconds id_ctTimeDelta num__73)
     (prop_microseconds id_daTimeDelta num__80)
     (prop_microseconds id_dhTimeDelta num__87)
     (prop_microseconds id_doTimeDelta num__94)
     (prop_microseconds id_dvTimeDelta num__101)
     (prop_microseconds id_ecTimeDelta num__108)
     (prop_microseconds id_ejTimeDelta num__115)
     (prop_microseconds id_eqTimeDelta num__122)
     (prop_microseconds id_exTimeDelta num__129)
     (prop_microseconds id_feTimeDelta num__136)
     (prop_microseconds id_flTimeDelta num__143)
     (prop_microseconds id_fsTimeDelta num__150)
     (prop_microseconds id_fzTimeDelta num__157)
     (prop_microseconds id_ggTimeDelta num__164)
     (prop_microseconds id_gnTimeDelta num__171)
     (prop_microseconds id_guTimeDelta num__178)
     (prop_password id_bbDomainCredential str__bc)
     (prop_password id_bfDomainCredential str__bg)
     (prop_password id_bjDomainCredential str__bk)
     (prop_password id_bnDomainCredential str__bo)
     (prop_password id_dDomainCredential str__e)
     (prop_password id_hDomainCredential str__i)
     (prop_password id_lDomainCredential str__m)
     (prop_password id_pDomainCredential str__q)
     (prop_password id_tDomainCredential str__u)
     (prop_password id_xDomainCredential str__y)
     (prop_seconds id_brTimeDelta num__44)
     (prop_seconds id_byTimeDelta num__51)
     (prop_seconds id_cfTimeDelta num__58)
     (prop_seconds id_cmTimeDelta num__65)
     (prop_seconds id_ctTimeDelta num__72)
     (prop_seconds id_daTimeDelta num__79)
     (prop_seconds id_dhTimeDelta num__86)
     (prop_seconds id_doTimeDelta num__93)
     (prop_seconds id_dvTimeDelta num__100)
     (prop_seconds id_ecTimeDelta num__107)
     (prop_seconds id_ejTimeDelta num__114)
     (prop_seconds id_eqTimeDelta num__121)
     (prop_seconds id_exTimeDelta num__128)
     (prop_seconds id_feTimeDelta num__135)
     (prop_seconds id_flTimeDelta num__142)
     (prop_seconds id_fsTimeDelta num__149)
     (prop_seconds id_fzTimeDelta num__156)
     (prop_seconds id_ggTimeDelta num__163)
     (prop_seconds id_gnTimeDelta num__170)
     (prop_seconds id_guTimeDelta num__177)
     (prop_sid id_baDomainUser str__bd)
     (prop_sid id_beDomainUser str__bh)
     (prop_sid id_biDomainUser str__bl)
     (prop_sid id_bmDomainUser str__bp)
     (prop_sid id_cDomainUser str__f)
     (prop_sid id_gDomainUser str__j)
     (prop_sid id_kDomainUser str__n)
     (prop_sid id_oDomainUser str__r)
     (prop_sid id_sDomainUser str__v)
     (prop_sid id_wDomainUser str__z)
     (prop_timedelta id_bqHost id_brTimeDelta)
     (prop_timedelta id_bxHost id_byTimeDelta)
     (prop_timedelta id_ceHost id_cfTimeDelta)
     (prop_timedelta id_clHost id_cmTimeDelta)
     (prop_timedelta id_csHost id_ctTimeDelta)
     (prop_timedelta id_czHost id_daTimeDelta)
     (prop_timedelta id_dgHost id_dhTimeDelta)
     (prop_timedelta id_dnHost id_doTimeDelta)
     (prop_timedelta id_duHost id_dvTimeDelta)
     (prop_timedelta id_ebHost id_ecTimeDelta)
     (prop_timedelta id_eiHost id_ejTimeDelta)
     (prop_timedelta id_epHost id_eqTimeDelta)
     (prop_timedelta id_ewHost id_exTimeDelta)
     (prop_timedelta id_fdHost id_feTimeDelta)
     (prop_timedelta id_fkHost id_flTimeDelta)
     (prop_timedelta id_frHost id_fsTimeDelta)
     (prop_timedelta id_fyHost id_fzTimeDelta)
     (prop_timedelta id_gfHost id_ggTimeDelta)
     (prop_timedelta id_gmHost id_gnTimeDelta)
     (prop_timedelta id_gtHost id_guTimeDelta)
     (prop_user id_bbDomainCredential id_baDomainUser)
     (prop_user id_bfDomainCredential id_beDomainUser)
     (prop_user id_bjDomainCredential id_biDomainUser)
     (prop_user id_bnDomainCredential id_bmDomainUser)
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
     (prop_username id_cDomainUser str__james)
     (prop_username id_gDomainUser str__mary)
     (prop_username id_kDomainUser str__john)
     (prop_username id_oDomainUser str__patricia)
     (prop_username id_sDomainUser str__robert)
     (prop_username id_wDomainUser str__linda)
     (prop_windows_domain id_aDomain str__alpha)
)
(:goal   (and 
     (prop_host id_jzRat id_bqHost)
     (prop_host id_jmRat id_epHost)
     (prop_host id_juRat id_fdHost)
     (prop_host id_kcRat id_gtHost)
     (prop_host id_jyRat id_frHost)
     (prop_host id_jsRat id_czHost)
     (prop_host id_kdRat id_csHost)
     (prop_host id_kaRat id_ebHost)
     (prop_host id_jwRat id_gfHost)
     (prop_host id_jrRat id_ewHost)
     (prop_host id_jpRat id_clHost)
     (prop_host id_jxRat id_fkHost)
     (prop_host id_jnRat id_ceHost)
     (prop_host id_jkRat id_eiHost)
     (prop_host id_jvRat id_duHost)
     (prop_host id_jlRat id_bxHost)
     (prop_host id_joRat id_gmHost)
     (prop_host id_kbRat id_dnHost)
     (prop_host id_jtRat id_dgHost)
)
)
)