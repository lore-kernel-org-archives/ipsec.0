Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794963295;
	b=SkBwnYTuaIIK6joOwjajy2t62O5/+1HB53GlYyNJcTh4tWRWO9S7pFhwTJ0ENlcG6rcT
	 mydyembheqPDrQ1I3BlNNLuCrS+M+aYS3h3DGeYpwjJnB9yAWFy+U+V2+DRCwxFbb1Mdi
	 N/H35I09oFLfWeFh6zQznbC41aSerPHCExTDJb/NQ0j8VNV+kgsYqAtwF7eDW4jMY3zI6
	 lQ6ICIucPwU0LtSxMK3HHQZ43D8PzRoHXFr4TJUcH8Xu3r+gsTqY3DYuPjvM0AF6eJfYl
	 4RM6xzmH7FDdlxxapvOCnuUUpAyS/bz/GjiK7Zq5jk3spXRijoGWEuApTPTgtksRoyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
	b=S+DvtcHfVxdYvBl9tKrxB2Fm5AYtsO/JkH5KBB98eqIMtuyKIQzZMEbM1uGKB2UGj4Ro
	 pclzivixOp20+fC830u3g/PQoHh8TOEF1l9gEsz63FtS9I4e1Q7aN1K8WPMWxqeRyYSfb
	 0TAF3UuCBzzRQljFC7wEIXceBsxz+FbVLDXT761oxhmCJf7KK7tusUkYRpXqQ8+vgWZUM
	 DXyWdWt4YZcKzoQ2gTVOc+Fq85AUwvH4005HQoh/HekvZ6MM+f2Ko7IC/6kLY10hTR7Sz
	 YBOsvO6i1E2I5/AsqvDvVrRGPdPFi0mXpWZ4picCpQ8a6NOCJQRpaOqL14HvXw6QLZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b="dyMEQr/N";
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A2606A31C
	for <ipsec@lists.linux.dev>; Wed, 18 Nov 2026 00:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A5A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=dyMEQr/N
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso165572a91.1
        for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 16:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1794963294; x=1795568094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
        b=dyMEQr/NfP/cGzB1G8ym2fNURR47lanAVQToUQENNjmX4vevT/Z6YuuMhkTSI6YmsR
         arirw7DA0retykZPlADErSiuDLjAxwcrpjycrcfHDFUg8fXAXqCIHgOhZSk0iM5e9BSF
         KyPZYvj8qRhh1KIAvu6kzZN1MbzkL3iyq/cAwUBLF5xgv78SMGdHFGikAr15Vn+lcg2y
         uv0NKy6xp5n6MjpkaxulPeAepj40eiEyRcdH9ukKcIC9gUkgRkhtyHEjH3N/FGkpL11Y
         l6QNgw+II2KnF09VwrEgU1Tg0TS02nAezuEa43goIA3CN8UTLawPi8ezzjvm46wg+zMg
         D4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794963294; x=1795568094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TSRfCfMrcfSVfOakdV+bbOGPK6RBMEyUrMS5MmfFhmU=;
        b=vmOseoClq5fHoiwtX+7ps8hd98478Dt4c2Mcj4lPfETGVIHBp14HutMHmIV1KclfrI
         8y9HFDrKEfT2Ef7c9MaZVxt9PlyP6UZsVtu2bS7Ga8MmhFPjdPGn4/OLRAXGUJlEuvRG
         gGkONNJYmG+WYc4fuNht3Xjp4CVDs5fVzxkUmWovQuronzPLbF2UFF2LFABxxZGkw/rp
         QxGBh40LTgjdK3i3ShfZriE22YkeeTXkJqbaq6sI1OejHZ6IfG1B9Olyy9OexePWA7hu
         K1Kd4VZi14uPocuLbG/HRf19tbAhPW8gFRmiRZKLgMNrkMzarJvg+C+DgJSEhrZkCzQV
         X21A==
X-Forwarded-Encrypted: i=1; AL+hErFh+nqtaT+PK0i+7UVYbEirIgJFgJS0J/GjhLqfyui0P56a+kjIDlyXZViEfmddLp0t5XmdhQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/9ipN8D1k2eDzdH+OyKWz2cYD4KE1w1/TKImvgDexISxWLe7qU
	Myxb7pZ/q1CTKN7giTqM4PezCfaubATjwQAlAGHcXf7/VJIt25rq2+QWzrHgGkOOnYyblpcmplL
	ZEX0X+e+TzGxJhMYRSGmmjlv15QRUHscHBhoOspJeB4hY/LdgANAL
X-Gm-Gg: AZFdTZdnhXj+RPUHUsio+1gRFwZRcs6lG+6PiyaEgAuxtZ5T+H9/QDtFY80kBvQTQgy
	qkY1/KOKvtuv1gDmqlyvaIF95G+y6SCTAiYR/G803V0BPT0v4JE9F4YhGpWPor1eqbedYgqp85X
	eytnPUmzpqxkW8T1t3LdkW6EZpxuv/xeBVCltA7NLmXCnsbDc38OibJ8fYphlpmHGqHbaRTWK+9
	2piRJGfy6v/xgf/zNuYQl6T23j8CWDhFsUH0G3rXwFf2/whPCR7/GOlKCnyYnDG9bUhY6KesYZw
	qBIIAnxNecWfoakjuk4nkKPMEn7JZYmVzMvKVpsAXzvVqvAuYq5MLJFBf0MD8pAuDG1sL0dm5u6
	leHbcFn6oQtzBksjhl2vwYbL3wd4=
X-Received: by 2002:a17:90b:3a50:b0:3b3:b71b:b01e with SMTP id 98e67ed59e1d1-3b3d0850f5fmr1030047a91.64.1794963294328;
        Tue, 17 Nov 2026 16:54:54 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d4914caasm161524a91.2.2026.11.17.16.54.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 16:54:54 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Christian Hopps <chopps@labn.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	security@kernel.org,
	Andrii Tereshchenko <opensource@andrii.net>
Subject: [PATCH ipsec 0/2] xfrm: iptfs: fix a panic and a use-after-free on output
Date: Tue, 17 Nov 2026 16:54:47 -0800
Message-ID: <b56bbced-a8b0-4ae9-80b4-1958ea36684c@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
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

TCP that a host sends through its own IP-TFS SA can panic the kernel.

The bugs are in the IP-TFS output path, net/xfrm/xfrm_iptfs.c. They
exist since v6.14 and reproduce on mainline v7.4-rc3, commit
aebb72744764 ("Linux 7.4-rc3"). Ordinary TCP retransmissions trigger
them; no crafted packet is involved. The kernel either panics with
skb_over_panic in the ESP output path, or the IP-TFS delay timer
reads a dst that was already freed. Where unprivileged user
namespaces are allowed, a user without capabilities can set up such
an SA in its own namespaces and panic the kernel. This series fixes
both bugs.

Details:

The panic: iptfs_output_queued() appends inner packets to
skb_shinfo(skb)->frag_list of the first skb of an aggregate without
owning that shared info. For local TCP the first skb is a clone of the
skb TCP keeps for retransmission, so the original gets a frag_list
that its len and data_len do not count. When TCP retransmits it and
the new clone is aggregated behind another skb,
iptfs_rehome_fraglist() subtracts the stale list's length and len goes
negative. ESP then copies the skb and skb_put() panics:

  skbuff: skb_over_panic: ... len:-340 put:-340 ... end:0x180
  kernel BUG at net/core/skbuff.c:215!
  Call Trace:
   skb_put
   skb_copy
   skb_cow_data
   esp_output_head
   esp_output
   xfrm_output_resume
   iptfs_delay_timer

The use-after-free: iptfs_output_collect() queues the skb for the
delay timer without taking a reference on its dst. Local TCP attaches
its dst with skb_dst_set_noref(), and RCU can free it while the skb
waits:

  BUG: KASAN: slab-use-after-free in iptfs_delay_timer
  The buggy address belongs to the cache xfrm_dst of size 296

The input path needs no such fix: xfrm_input() calls skb_dst_force()
before the type and mode input handlers run.

The series:

  1/2  Unclone the first skb before appending to it. Send a cloned
       skb that has a frag_list on its own, and do not take page
       frags from a cloned skb.
  2/2  Take the dst reference with skb_dst_force() in
       iptfs_output_collect(), before the skb is queued.

Affected: since commit 0e4fbf013fa5 ("xfrm: iptfs: add user packet
(tunnel ingress) handling"), v6.14. iptfs_output_collect(),
iptfs_enqueue(), iptfs_rehome_fraglist() and iptfs_output_queued()
are unchanged from v6.14 to:

  mainline    aebb72744764 (v7.4-rc3)
  ipsec       f0e68014f4ac
  ipsec-next  7b6ab4dbc156

CONFIG_XFRM_IPTFS defaults to n. Current Ubuntu, Fedora, Arch and
openSUSE Tumbleweed kernels build it as a module.

Conditions: CONFIG_XFRM_IPTFS, an SA in iptfs mode that carries TCP
originated on the host itself, and retransmissions, which any path
loss causes. TCP that the host only forwards into the tunnel did not
trigger either bug in 8 runs. Creating the SA needs CAP_NET_ADMIN,
which a user has inside its own user and network namespaces: on
v7.4-rc3, uid 65534 set up the SAs that way and hit the panic. Only
the crash is verified. Whether the use-after-free can be exploited
further was not assessed.

Discovery: the panic was observed on a machine in real use during the
andrii.cloud (ARIN: AS402801) rollout. That was a distribution kernel
tainted by an out-of-tree video card module, so it was reproduced on
an untainted distribution kernel and then on mainline. The
use-after-free appeared under KASAN while reproducing the panic on
mainline.

Reproduction: v7.4-rc3 on x86_64, defconfig plus kvm_guest.config
with KASAN, IP-TFS built in, in a KVM guest, not tainted. No kernel
modification and no fault injection. Three network namespaces form a
client, an IP-TFS gateway and an HTTPS server that is the other
IP-TFS endpoint. Clients fetch a 50 KB page for 40 seconds while
netem drops 5% of the packets sent to the client, so the server
retransmits through its SA. init-delay is 20 ms. The kernel config
and full console logs are available on request.

Fix verification: most boots of the unpatched kernel crashed, with
the use-after-free or, in a few boots, the panic. No boot with the
series crashed, and KASAN reported no use-after-free in any boot that
had 2/2.

The series applies to ipsec f0e68014f4ac and builds there and on
v7.4-rc3 without W=1 warnings. The boots ran v7.4-rc3, where
net/xfrm/xfrm_iptfs.c is identical. Kernel selftests were not run;
none of them covers IP-TFS.

A reproducer is available to maintainers on request.

Mitigation: use tunnel mode instead of iptfs mode on SAs that carry
locally generated TCP.

Related work: this is not commit d042487dc118 ("xfrm: iptfs: fix stack
OOB read in iptfs_skb_reset_frag_walk()"), CVE-2026-98372, and not the
pending series "xfrm: iptfs: fix queued receive state lifetime".
Neither touches the output path.

Link: https://lore.kernel.org/20260930050307.1978654-1-roshaen09@gmail.com

The crash analysis, the patches, the reproducer and this text were
produced with an AI coding assistant (without CVP) and reviewed by 
the submitter.

Andrii Tereshchenko (2):
  xfrm: iptfs: don't modify the shared info of cloned skbs on output
  xfrm: iptfs: hold the dst while a packet waits on the output queue

 net/xfrm/xfrm_iptfs.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)


base-commit: f0e68014f4ac1653b2980ab76744f4dfdffdbac5
-- 
2.53.0

