Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.216.20.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745131;
	b=XMz7SXljZJ9viRFmr/nXfud6NlZg66NQ8DfCoycwrv1HkhsdQcDSg/eX5S1KdK3uxyt2
	 czO4z/+aUTOZou0U5EheHpSthmFxFoRIyudij3xfVmYnoEme4LsXO0vojbdPYvvY2p74f
	 YrN0dKP1FuB0+AAmz8RqY9t68/H8HPHGqftQNKEXgIUZmD03mGrubED0jfdDc3YqlQ2SZ
	 bPgbSwqXk/9PaXbMdKe3WeL64BwsMV8GCymaqTA4uBqv5SEaOaHjzBiFP8mrM4jmsMM76
	 mnBqth5QEk6X0USY/jwLrYX0MkegQKMCWX/NvJSI66PVP3IjQMqZxqkkygHLw5s80bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745131;
	h=DMARC-Filter:Received-SPF:Received:From:To:Cc:Subject:
	 X-TERRACE-DUMMYSUBJECT:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-TERRACE-SPAMMARK:
	 X-TERRACE-SUPERWHITEIP:X-TERRACE-SID:X-TERRACE-CLASSID;
	bh=1KQwmcwphZq919r47d7b00A/kdgyKtkTtdtloI9GrsI=;
	b=NyjR+kLO38xhJPlm8VzMne7HdXNvvJLzcowWIMAqng6sgPWFpylhrkjIoP+KVs63rWFS
	 aitOIQw3zp0jt305c1FyHNFpvJMkwykrnJ84A0Rz0O+aBSlNvJHbPDsJctQLnnTmNxGj2
	 yzA+9gGomQByHLiZ8cuAqlKJCMtZzZ9+20NxS6wYjw8cAUnXGRfHn+ze2Go0opQaJ2GZ1
	 n4SxR7J/vUaxhZ8gXiwZyRUCavjnuP4XMu1WJVv+XSzdROsPNJO2IyPfl6NnGcVCj5sj+
	 LcWcsb60U/cSNK7yWNsUzaD6ieddhu97X8jQJIJ1NGThqKBgZ/nhPEaLtnOTVzkNE6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pribit.com;
	spf=pass smtp.mailfrom=pribit.com;
	arc=none smtp.remote-ip=35.216.20.220
Received: from prod-dose-smtp-3.daouoffice.com (prod-dose-smtp-3.daouoffice.com [35.216.20.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01C2606A32D
	for <ipsec@lists.linux.dev>; Fri, 27 Nov 2026 02:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F01C2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pribit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pribit.com
Received-SPF: SoftFail 
	client-ip="106.245.249.210" envelope-from="his1415@pribit.com" 
Received: from [106.245.249.210] ([106.245.249.210]) 
          by prod-dose-smtp-3.daouoffice.com ([10.37.10.10]) 
          with ESMTP id 1795745089.89229.140503668266560.prod-dose-smtp-3
          for <>; 
          Fri, 27 Nov 2026 11:04:48 +0900 (KST) 
From: Hong In-su <his1415@pribit.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	sd@queasysnail.net,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	his1415@pribit.com
Subject: [PATCH ipsec-next v3 1/2] xfrm: add ARIA CBC and CTR support
X-TERRACE-DUMMYSUBJECT: Terrace Spam system                                  *
Date: Fri, 27 Nov 2026 02:04:47 +0000
Message-ID: <20261127020448.55891-2-his1415@pribit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127020448.55891-1-his1415@pribit.com>
References: <20261127020448.55891-1-his1415@pribit.com>
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TERRACE-SPAMMARK: NO       (SR:11.57)                     
  (by Terrace)                                                  
X-TERRACE-SUPERWHITEIP: pribit_com_packetgoOS
X-TERRACE-SID: 1795745089.89229.140503668266560.prod-dose-smtp-3
X-TERRACE-CLASSID: Terrace Spam system                                      

The kernel crypto API already provides ARIA implementations, but XFRM
does not have algorithm descriptors for them. Consequently, ARIA cannot
be selected for ESP through XFRM.

Add XFRM algorithm descriptors for CBC and RFC3686 CTR modes using the
existing cbc(aria) and rfc3686(ctr(aria)) crypto algorithms.

The CBC and CTR modes have been tested with IPsec using strongSwan.

Signed-off-by: Hong In-su <his1415@pribit.com>
---
 net/xfrm/xfrm_algo.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/net/xfrm/xfrm_algo.c b/net/xfrm/xfrm_algo.c
index 70434495f23f..98ef2c48982a 100644
--- a/net/xfrm/xfrm_algo.c
+++ b/net/xfrm/xfrm_algo.c
@@ -512,6 +512,32 @@ static struct xfrm_algo_desc ealg_list[] = {
 		.sadb_alg_maxbits = 256
 	}
 },
+{
+	.name = "cbc(aria)",
+
+	.uinfo = {
+		.encr = {
+			.geniv = "echainiv",
+			.blockbits = 128,
+			.defkeybits = 128,
+		}
+	},
+
+	.pfkey_supported = 0,
+},
+{
+	.name = "rfc3686(ctr(aria))",
+
+	.uinfo = {
+		.encr = {
+			.geniv = "seqiv",
+			.blockbits = 128,
+			.defkeybits = 160, /* 128-bit key + 32-bit nonce */
+		}
+	},
+
+	.pfkey_supported = 0,
+},
 {
 	.name = "cbc(twofish)",
 	.compat = "twofish",
-- 
2.43.0



