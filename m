Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570610;
	b=Kb/UBTciPW9DZy4cXOkWWFxBAM6Dz3bJfAIUOgW86DMHnIjxGotepx3vlIaMsfmFZT+v
	 e4RZgE7DbAY8+E8GXGvmRx2ANEu5PpsFvl9YuisAHmoMf0HSqmG680rFe+cHvfoSEvhLV
	 4V5ndQI+ETHlf1IJQQx3YM9pYDB1FV9G7TojQAiWIokG+3/pJLGLxoalK5LfjrTME+8yH
	 X0hU/w8fJ8afSbXRKe/YKvxBzkJ3XO6uIpdYEkxfp+TXCKRX5UYxinW+X7th5sjb4EZN5
	 Pr54Er/DcHLZqbcwU82KxQJd9URv9RFK93eBH/WuD3avA3JIdfKPy8igFYyaapqGwUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570610;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-NV-OnPremToCloud:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=0MTp1eyh+CLNbcchL9eCGWEkLrgTIe63/cgKLQroHUA=;
	b=IoR+uuSQs/9WVTGkT0/Eq2fa8NGGpdDCeKXQuDtE5gXWB1BYaKBpU1/rCdnB0Xx4ZCId
	 YXlJh+5C1etabFCIAVNBZNt6uNk1yuErN0zr1payXbASr12tl5M2Q6sNmzl+YnRFkZvyE
	 ATYqLEvesltkjiK8s1lU+8UCXdl2Ne7J/wyGjjDawwN4M+8PsvEbdRzBFU/poL1ecSXz+
	 wZQWFZ/e+YZAu8pwogMrXr5SLi8OZru5kPMuNJ6U0gawIgyqLqmwf1yBeG+fihrvpE3Ot
	 TVGgYXCKOhU17HkhRn77cPmmhM3oTmdqKLpy+gUaDlp7W5oHp043VWj0bJCNI5Zn67A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ettHELMN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.54
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84111606A31E
	for <ipsec@lists.linux.dev>; Wed, 25 Nov 2026 01:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84111606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ettHELMN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ22ER/qFwXXcL+i3ShYNKY7pY7LJuLTFhlovWshrFSDgizDA8wxavLh0g5FOpm8YPQBi49GjZaX8mdhgvjvD3KHgPNVHC1SqbfZPsd8Q4QbJ0Vm4sKwuPuUWAuW1ms18dICM0vZZ4Xqt8bbkY5u1vhSuJNotiEcCfxRVMr+Glw8Imp7KrO3mxOgMQrVlQ4nk+PuDkXan2QaYEc6/aGTXj3LLqXAdUb+Knl00Qb6EWcE9YLRIFWDwUD+RbT+Cdx6uP0Xg4T1JQJ0yBXSfiSRzAMsQ/1NcXBlODtC4HAP1t78IC84RKOimLjPZGXJFcty0Cyr8WvBJ0+jD2TYV5odyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MTp1eyh+CLNbcchL9eCGWEkLrgTIe63/cgKLQroHUA=;
 b=lAg33OXx8S/B6w70ViBRW+KfAG4r7CXyj+GqzcxZ25auaVSVGvwdCV928tniuxedscCg7iOklVs3kVZXw1hpE5XluxhR1HRbWPOIAyNSz3BAo6eSFtAIlaUDCKExBWv24ZAxSWLDG9I6oOcah1zfS283M/ISdP4qxqjUcDLSzFuIsScixGT0+DybJves7a2LjG5BBCx4wjJi6TpOwCpUT2IK9gbNxEDr7Dj5wtuwLhpVlsk5TFxwq6n0spXzjUwOVby8XwEBPed9mZf3tyQ/p30rcI07e2jyhpErpfAb6HsQpOadGqgAOzymF9jh2kS7fAFTNhhnH+HkHj1fniYVhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MTp1eyh+CLNbcchL9eCGWEkLrgTIe63/cgKLQroHUA=;
 b=ettHELMNaiCtY0VJWAKN6zhZD52ZvNIvVyulo15sfthqr8Ehdiw6BngMxsVtuxcTxShLS/LZ1MhXdcW5xTwuk+z4T/bckf4keuZFDNKln5l2F3xoK3Pj0jb18JvKlSv5w8c1+KDeOZdffpHn1K3+3hOmWjwDeq1NmDmgkH7quzKUTpQOQerUfLvOVN3CzxJa2mdipslGJKN7HRE1/Ufz47XN/goI8Wr0FHN0CZUtFlZHlJ+BPyUbeYbzon2uqQTCkcj0fBliyVNnIAVma1sQ+X5RJq0tccJp8x5sSTSU/koHkuxSZSvq//13t2wu9MmWWZWMQCJ8EbF6w5N4lGJgtA==
Received: from BL0PR01CA0082.prod.exchangelabs.com (2603:10b6:208:25::38) by
 SA1PR12MB8142.namprd12.prod.outlook.com (2603:10b6:806:334::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.4; Wed, 25 Nov 2026 01:34:41 +0000
Received: from MN1PEPF000793FE.namprd05.prod.outlook.com
 (2603:10b6:208:25:cafe::2e) by BL0PR01CA0082.outlook.office365.com
 (2603:10b6:208:25::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.6 via Frontend Transport; Wed, 25
 Nov 2026 01:34:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF000793FE.mail.protection.outlook.com (10.167.249.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 01:34:40 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:20 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 17:34:20 -0800
Received: from mtl-vdi-603.wap.labs.mlnx (10.127.8.12) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 17:34:17 -0800
From: Jianbo Liu <jianbol@nvidia.com>
To: <netdev@vger.kernel.org>, <ipsec@lists.linux.dev>
CC: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Florian Westphal
	<fw@strlen.de>, <linux-kernel@vger.kernel.org>, Jianbo Liu
	<jianbol@nvidia.com>
Subject: [PATCH ipsec 0/4] xfrm: Fix device state teardown races
Date: Wed, 25 Nov 2026 03:34:08 +0200
Message-ID: <20261125013412.1123866-1-jianbol@nvidia.com>
X-Mailer: git-send-email 2.39.3
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
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF000793FE:EE_|SA1PR12MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a26805b-935d-4653-3ef6-08df4a9446a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|7416014|23010399003|376014|261009223027099003|18002099003|56012099006|11063799006|261028144727099003|261102123227099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zbAtz6DIdcIQr5KE1oB5oJ35BKDV+deVA14se0j6xn3Syaa5iFayZL+IEnYRFY0Fuze6MbAOkj8JnVSgn4WDbEW4G79arjJJsuHQN6JIYlAo3sUIJHbON0j8MauFGQY/MCZb4CNGOx7xZa8ALBnDrgqub2jlx2Zql0jNENxWJrX4xVLIcp1+m7aepBpN/vkEmzpY+foDE971E2yYKKxQTN+A/EodZ/5hf3iuEtvMSC7USKlAQrKi7Vi5DYwo0ZSaRAgAoi0ZGibNye4paVVqdnC5mo89bc94K8MEuS35htSv6RudMu4v265moknXue8Bys7kG9aW3hw/ubRs8TfBqD32WdiKwqVPkczPiPWGSZLzYE4QHCFVBCv8b1gposvLXtp9bDS9WMEd1O3xe0lrxca4c9E7qT0euXofADSEY+2wo1TdpWpgGKFyAEcEvmMdsNsvBQAo4dlcjoo5szrJ46b5p1DjLRoyxiOhX07NDNp7GAfGAiHkGw7c7C6y+4Z34DhZQ5sLf975y8dP0Cask3k6zBLzqukmahtdYQ+VTWLvzQnhABc1cMwlBjMVJ4sGDenNQbJYn6ftUBxLSefuLLGZfW3EjM+rQi08azd+CzRgR+aWzgoEGOoPElxhcYJj8dgouHuOp05yzBbrm/381r/FzahBU92d7LoxfpmOPGQDy7VHyFUM1ztsNsM1hScssXuxu4ZhUjS67IYyvIwOyQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(7416014)(23010399003)(376014)(261009223027099003)(18002099003)(56012099006)(11063799006)(261028144727099003)(261102123227099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JiPYsvelaDN105YfhgcM37OGv0IsDmltu8vz8doYFy7m/7CiE8A4lzj8CCY6aMpSrDSsozpogUSZYf3DKqal7+GnBpk4a1JDwaSJjH7kXZnlU+ZMDkbn1c/E5UGOI2aD7uOUTAdEaMFNo57lcJgJVogvfhzr2ArDJzRqF+l7F/IxstqHD4FndXrQMcWSmHJCsoR9PUiQo6ODJWLbdeSdMkpqfHoS8tn9YLcwBdeN8ExH9nRx+zUUF4o0IH1QmNnf3as03Nd8PIus49yu7CFBg8dod0v7bmUNbUP3WpAeXSoe6XPcCBnyeKhlCVp/hI8ZdxrngaQUeWmV/3hOY4GB8/wGJQbjEWb27X3ZGSuttsCofiqb0xoaD5x3ICHCVflFM3LjdqdrKhTEXojpfMyiDRrjDn0g5jPCW/AOAN452IwhN2Jm2tSaaUtWv8HS5Ece
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:34:40.9102
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a26805b-935d-4653-3ef6-08df4a9446a7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF000793FE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8142

Three fixes for the teardown of xfrm device offload state and one
revert, for ipsec.

xfrm_dev_state_free() runs for the same state from the state GC, from
the device flush and from xfrm_state_find(). Commit 89fefad9f971
("xfrm: serialize state GC with device state flush") serializes the
first two with a mutex, but xfrm_state_find() runs under RCU and
still races with the flush.

Let only one caller free the device state of an SA, hold a state
reference in the flush and wait for an RCU grace period before the
free. The mutex is not needed after that, so revert that commit.

1. xfrm: Give GC list nodes their own storage
   Stop sharing the GC list nodes with the bydst and bysrc hash nodes.
   Patch 2 uses gclist on states that RCU readers may still walk.

2. xfrm: Serialize device state teardown
   Let only one caller free the device state of an SA.

3. xfrm: Wait for an RCU grace period before freeing device state
   Let RCU readers of the driver state finish before the free.

4. Revert "xfrm: serialize state GC with device state flush"
   Remove the mutex that the fixes above make redundant.

Jianbo Liu (4):
  xfrm: Give GC list nodes their own storage
  xfrm: Serialize device state teardown
  xfrm: Wait for an RCU grace period before freeing device state
  Revert "xfrm: serialize state GC with device state flush"

 include/net/xfrm.h     | 10 +++----
 net/xfrm/xfrm_device.c |  4 +--
 net/xfrm/xfrm_state.c  | 61 ++++++++++++++++++++++++++----------------
 3 files changed, 44 insertions(+), 31 deletions(-)


base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.39.3

