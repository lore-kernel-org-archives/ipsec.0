Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794926376;
	b=RDGcdtY98q1m4e3iBemjbhFpNaqU0boyRDKeFV+zMrQXfVLoIzNb6654+04dZtTclDjR
	 QrA8IMdoiO4Z7fnv3YdMqSRTeKzzma3wUraX+9GECTERDNDxClMU9pouUqa9GI91eYAwL
	 lGoDes+u7fY05x/uOKiIdY/S+QVcu+JRSwdOKckkWRaREu1LTbUBTXNA2Ys0u4mEv67dk
	 Cpk5pPLJbCV/IOYb09VIr+KBcvOvJQO7LECr9prhrzlMNXFifer8rpSRUiJE3ufksHWPw
	 /bfxUhXaIVoz/S4Fv5y0mu0IgJ4V5qKsjofyJFakJ+YUqqrZ15whFGwD8KSXELIddvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P0olrsHIDvlSNbwag3VVPNk9dsjV/Xue4p9PcZmWx0M=;
	b=U8++kfZbI1B9U39pjAKy89oY2r+nFiBlDjaDrQh+Sr8e41YmIubxj/TQHj6ik4iEQ5eb
	 1yq9JaktbvqzBNNELzhHDaOVYF7JkJlMdpbNSXZG8XHZmHTaUfDlIVXFn/vSGi187QLdZ
	 tnOmxwRK60ZxSJaO4fBSvpINVI60RYAr8x6E7h6Wh5xB1awjXsVnYZQ3MnTtQRFwiBYSG
	 kCaVCkEGG6JEZf4SowUlNH1su9dpavAljOFre/+FjEelIT3YdGb7KCUyESVJZjrdJbYPs
	 r/3Gta/Tfd66rdfmezOO25CT6IsipIKzPZU3WyFH6VLN3ouwXS2EDBD5KuNwRqGWOFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=OpF00zo7;
	arc=fail smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6440606A31C
	for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 14:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6440606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=OpF00zo7
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso10550016a12.0
        for <ipsec@lists.linux.dev>; Tue, 17 Nov 2026 06:39:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794926371; cv=none;
        d=google.com; s=arc-20260327;
        b=XjwUw9epWCHH2t2R6v224/lcFzP4VI/27nA2S8kyTmce0RqFmZ3OyABGjdyPEcpBwG
         ipzFMPhMIQuTmw0PPW53DH0Ir8BHzSH9h8lQ6fYy1cG53SAymmctYTX0OYIkdzFDmuXt
         fCwxhZAA22Eo4jx9xjWZq3Wn4uN3KfGzcHCKjvcy+ZQpGDEF9w1bRdVeadBddQiIcesc
         bDDe7ajMo6/FlyN9at28Nv1x+hRmD0U9MqN4BnNFGq4upgKYTVPyLVI0lhmyvVNgruz9
         pNVzpuoimK03z7Lr7sbAR7fsspAMtDERyaeSD/sF7qu/fH1qv91PietJM+JE+lqaBqpM
         cwaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P0olrsHIDvlSNbwag3VVPNk9dsjV/Xue4p9PcZmWx0M=;
        fh=qgo0YRgMt0Uo4Ki/aklzAG5Uv9j1B3k9ei05HDZL99w=;
        b=h3DIGUAZu1SgTMDUydvzq2IPR/YMEaCEUJyh5oMs4H9vGrLc6ivpL0aDCb/+ViHkaQ
         GZuQEVNBXdsU9jSAdMNmQzxcTdu1IVTDNuY/U/j7zlfsgPybxA20jXHUJjaLHFX7TMZX
         X08zodoqWQnJoiwKDxCeXv+mRtYtgerzYKQflpRgiP7humTl/Ho8DIdczmwQsvrMg81j
         NEUIMlb4WdVEikphy3as/IXcoVSuuJSTHUfTqKAkjUEtNN5WT3ip2GviajhWF/FDyFNp
         CQINLBJXhVmm9nmMrzyw108MrnJGY3/Mn79naNh0zSjr53GslSJUNBrBRcplyl4kWBbw
         PT+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1794926371; x=1795531171; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0olrsHIDvlSNbwag3VVPNk9dsjV/Xue4p9PcZmWx0M=;
        b=OpF00zo78We5UBGkQqrtJt/c0mbJ63BJ6djJLQB+TY7dbTwqaUmlwVFUiII+3PI+jp
         +OnL/QsjXhtHn7J03O48jselAoUQkGCNqyclpFEcIn8LTR0jeCaeiodMNMWyGKMQr/kE
         929zB1tB1UbuWE2nxV0Ejs0JvjiBuyZd9IYtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794926371; x=1795531171;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0olrsHIDvlSNbwag3VVPNk9dsjV/Xue4p9PcZmWx0M=;
        b=al2Tp+/hAajKerYcKk2ndtMvjUnMLy3rciV/Xgsy7uEhfZRiO/Eil9LQW4NrvGc7Su
         rfnwfhsK7oYtD8ABOLfMzpvdrn58sSxznA7LMnfklbiUJC+viDojb35wqgOPsOUg9KIZ
         RVe5dmgOir221v8BGEb8DtT2QRNkt+VH7254u4R4ayQYcv3GHEH8XN5ReTHr9vUlvNl/
         CAoNWLaSirXztmQv5JGw0ojZl4vA++4V1/ag1uhZdVTy3MjAh3P9X3zeHslBXnR9bOFf
         VOO9xwmzScStlwmZK3vzuND2V+3BuDjVdovJd2QWtrxBud1Wo0Sp6IGtqLYoeuT0uwtW
         C65Q==
X-Forwarded-Encrypted: i=1; AL+hErHCVuXTC6lrByhBed9VYSNLGEiB3bDyzTNrqMUix0RTnfq/3C7a6EjEEu1eegfX0LWgULaIqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/CndnqAjZyvZlW7DFkEwLxdwy1pm4AWfVXJkiKfJ6klIe2NPlW
	c+nGPcl63Iq+TyNmktyNCbiHwaG5IT3lTcLdovaraG8Sm5wPSdsvIbSOBW9uYYyznzODoutoxRe
	V0mUbF15R4m8zVrsB01nMrwUBoJs+mVWMRWN1n6kFoA==
X-Gm-Gg: AYBFou3kpy6EDQB1YFDUcSrlMHDnLL4jkzQ33qo5iCDL8SdEeIVMzMhKKqs2SNvxZY4
	BSAODPZsc623o1y8r9Etu3Bt19y/FyW1Mx+0zV4N44zTHu5Fr/yTG1rzuuFwCIpEx9Ix4Rl0XCD
	oxbPPgXDHEPsRh0OTQSrxnpeT6QthFkt0gGQnNgk8rCvuxKbQopesFuLb7lqE0lbVcTy6c3Rno+
	lUAX6UAoxiutmPDXv08XEaup/DbxjRMmI7HY3C3MJcPV8qmIRWx9eL0tWdtppP/uhbKqQd/pXNX
	rsBfZvfcPtpN94+g/XsVT/wbbn4WBi4hlvks02Jr1SAzj73O+cAUWzzViq5LSHxKTTFauqOfreW
	ra1tH/Bsm82ijZZpFJOUOyWY7d1Vc24Cm1PtXl3zMZPRJGvoGbzzpUWtGrNQGfRGRdpjwmccHCa
	F8vDBa+vPZLmEbDzwXZHsBd/fdqkFIeEot8qrEo7SsRk4RIZKB8Krv+T7q748Q35RuzK2LMXZtZ
	vouNw==
X-Received: by 2002:aa7:cf97:0:b0:6b7:df0c:18c2 with SMTP id
 4fb4d7f45d1cf-6b7df0c1c80mr7160252a12.12.1794926370896; Tue, 17 Nov 2026
 06:39:30 -0800 (PST)
X-Mailing-List: ipsec@lists.linux.dev
List-Id: <ipsec.lists.linux.dev>
List-Post: <mailto:ipsec@lists.linux.dev>
List-Help: <mailto:ipsec+help@lists.linux.dev>
List-Subscribe: <mailto:ipsec+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ipsec+unsubscribe@lists.linux.dev>
List-Owner: <mailto:ipsec+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261117062046.3286096-1-piyus@iiitd.ac.in> <CAL4Wiipye9XojWhp2-XqPC0kABk3LsTmE8Z0D779+GJT_A7N8g@mail.gmail.com>
In-Reply-To: <CAL4Wiipye9XojWhp2-XqPC0kABk3LsTmE8Z0D779+GJT_A7N8g@mail.gmail.com>
From: Piyus Kedia <piyus@iiitd.ac.in>
Date: Tue, 17 Nov 2026 20:09:19 +0530
X-Gm-Features: AclHuK8etuqyiEgjTDf-ydiBAGJEz77A5x1U4gnTFtk-tCGeeoPrSbeiq3QmSew
Message-ID: <CADq=QSx0zmA5Ks7-aZYai-t7buC7hP5Xj9d6p4Rgkx0ixE_Uaw@mail.gmail.com>
Subject: Re: [PATCH net v2] xfrm: do not write the ethernet header when the
 mac header is unset
To: Eric Dumazet <edumazet@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, Andrea Mayer <andrea.mayer@uniroma2.it>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, ipsec@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Kapil Vaswani <kapil@presceralabs.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Thanks for the suggestion! We have submitted a new patch:
https://lore.kernel.org/all/20261117143612.95112-1-piyus@iiitd.ac.in/

We also tested it on our platform and the KASAN bugs are gone after this pa=
tch.

Thanks and regards,
Piyus Kedia
Kapil Vaswani

On Tue, Nov 17, 2026 at 1:43=E2=80=AFPM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le mar. 17 nov. 2026 =C3=A0 07:21, Piyus Kedia <piyus@iiitd.ac.in> a =C3=
=A9crit :
> >
> > xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap() restore the
> > mac header after removing the tunnel header and then stamp the protocol
> > into it:
> >
> >         skb_reset_network_header(skb);
> >         skb_mac_header_rebuild(skb);
> >         if (skb->mac_len)
> >                 eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> > skb_mac_header_rebuild() does nothing at all when the mac header was
> > never set:
> >
> >         static inline void skb_mac_header_rebuild(struct sk_buff *skb)
> >         {
> >                 if (skb_mac_header_was_set(skb)) {
> >                         ...
> >                 }
> >         }
> >
> > and it does not clear skb->mac_len either, so on an skb whose mac heade=
r
> > has been unset while mac_len stayed behind, the guard is true and the
> > store goes through an unset header.  skb_mac_header() is
> > skb->head + skb->mac_header and the unset value of that u16 is 0xffff,
> > so eth_hdr(skb)->h_proto is 65535 + offsetof(struct ethhdr, h_proto)
> > bytes past skb->head: a two-byte out-of-bounds write landing far outsid=
e
> > the skb, in whatever object happens to be there.
> >
> > skb_unset_mac_header() leaves skb->mac_len alone, and of its callers on=
ly
> > skb_carve_reset_headers() clears mac_len by hand.  end_dt_vrf_rcv()
> > (SRv6 End.DT4/End.DT6) unsets the mac header on the receive path so the
> > VRF device can rebuild it, and leaves mac_len at the value the original
> > ethernet frame had, which is how an skb in this state reaches xfrm inpu=
t:
> >
> >   tun_get_user -> netif_receive_skb -> lwtunnel_input
> >     -> seg6_local_input_core -> End.DT4 -> end_dt_vrf_rcv
> >     -> skb_unset_mac_header (mac_len stays 14)
> >     -> VRF l3_rcv -> ip_local_deliver_finish -> xfrm4_esp_rcv
> >     -> xfrm_input -> xfrm4_remove_tunnel_encap
> >
> >   BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x2=
20
> >        net/xfrm/xfrm_input.c:258
> >   Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
> >   ...
> >   The buggy address belongs to the object at ffff88805f858000
> >    which belongs to the cache zswap_entry of size 56
> >
> > The address does not depend on mac_len - it is always
> > skb->head + 0xffff + offsetof(struct ethhdr, h_proto), since the unset
> > sentinel is what mac_header holds - and mac_len only decides whether th=
e
> > write happens.  The value is skb->protocol.  It is two bytes at a fixed
> > 64KB offset, crossing into an unrelated slab cache.
> >
> > A THIRD SITE HAS THE SAME THREE LINES, in __input_process_payload()
> > (net/xfrm/xfrm_iptfs.c), reached when an IPTFS payload is decapsulated:
> >
> >         skb->protocol =3D protocol;
> >         skb_mac_header_rebuild(skb);
> >         if (skb->mac_len)
> >                 eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> > and it has its own KASAN report, a use-after-free rather than an
> > out-of-bounds, for the reason given below.
> >
> > That function already knows the test is needed.  Its other mac-header p=
ath
> > is guarded by old_mac, which it computes at the top as
> >
> >         old_mac =3D skb_mac_header_was_set(skb) ? skb_mac_header(skb) :=
 NULL;
> >
> > and only rebuilds the header when that is non-NULL.  The site above omi=
ts
> > the same check.
> >
> > WHY THE THREE REPORTS CARRY DIFFERENT TITLES, which is worth stating so
> > they are not read as three defects.  The address written is a fixed
> > skb->head + 0xffff + offsetof(struct ethhdr, h_proto), so what it lands=
 in
> > is whatever the allocator placed 16 pages past the skb: a live object g=
ives
> > slab-out-of-bounds, a freed one or a page back on the buddy free list g=
ives
> > use-after-free, and a different LIVE object gives nothing at all, since
> > generic KASAN only tests whether the target address is poisoned.  Acros=
s
> > six boots of one reproducer the write executed in five and KASAN report=
ed
> > it in one.  On a kernel without KASAN it is always silent.
> >
> > Only write the ethernet header when there is one.  This mirrors what
> > xfrm4_transport_input() already does, where the header length is taken =
as
> > skb_mac_header_was_set(skb) ? skb_mac_header_len(skb) : 0, and what
> > __input_process_payload() already does for old_mac, and it leaves the
> > behaviour of every well-formed skb unchanged.
> >
> > Link: https://lore.kernel.org/r/20261116174531.2540348-2-piyus@iiitd.ac=
.in
> > Signed-off-by: Kapil Vaswani <kapil@presceralabs.ai>
> > Signed-off-by: Piyus Kedia <piyus@iiitd.ac.in>
> > ---
> >
> > v2:
> >   - guard the third site, net/xfrm/xfrm_iptfs.c in __input_process_payl=
oad().
> >     It has the same three lines and its own KASAN report, a use-after-f=
ree,
> >     and v1 left it alone - which would have closed two write sites of t=
he
> >     three while leaving a confirmed one live.
> >   - say why the three reports carry different titles (slab-out-of-bound=
s,
> >     use-after-free, use-after-free): the address is fixed relative to
> >     skb->head, so the verdict is decided by whatever the allocator put =
16
> >     pages later, and a live neighbour gives no report at all.
> >   - cite __input_process_payload()'s own old_mac computation as the in-=
tree
> >     precedent alongside xfrm4_transport_input()'s.
> >
> >   No change to the two hunks v1 carried.
> >
> > Tested at runtime on mainline before and after: both kernels built from
> > aebb72744764 ("Linux 7.4-rc3") in one scripted run, x86_64 with
> > CONFIG_KASAN_GENERIC, CONFIG_DEBUG_NET, CONFIG_IPV6_SEG6_LWTUNNEL and
> > CONFIG_NET_VRF. Six boots each, injecting after the uptime passed 130s.=
 The
> > skb_reset_mac_len() warnings at include/linux/skbuff.h:2995 are the con=
trol:
> > they fire when the unset-header skb reaches the receive path and this p=
atch
> > does not touch that site.
> >
> >                   skb came through   reached the write   KASAN
> >   unpatched         5 of 6 boots       5 of 5             1
> >   patched           2 of 6 boots       0 of 2             0
> >
> > Every unpatched boot in which the skb arrived reached the write; no pat=
ched
> > boot did, including the two in which the control shows the same skb arr=
iving.
> > The one-in-five KASAN rate is the point made in the changelog about the
> > verdict depending on the neighbour.
> >
> > checkpatch reports one thing, the missing Fixes: tag. Neither tree we
> > reproduced on carries history for these files, so we could not determin=
e the
> > introducing commit; we will add it if you can name it.
> >
> >  net/xfrm/xfrm_input.c | 4 ++--
> >  net/xfrm/xfrm_iptfs.c | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
> > index 5ed87d513..624ff8055 100644
> > --- a/net/xfrm/xfrm_input.c
> > +++ b/net/xfrm/xfrm_input.c
> > @@ -254,7 +254,7 @@ static int xfrm4_remove_tunnel_encap(struct xfrm_st=
ate *x, struct sk_buff *skb)
> >
> >         skb_reset_network_header(skb);
> >         skb_mac_header_rebuild(skb);
> > -       if (skb->mac_len)
> > +       if (skb_mac_header_was_set(skb) && skb->mac_len)
> >                 eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> >         err =3D 0;
> > @@ -291,7 +291,7 @@ static int xfrm6_remove_tunnel_encap(struct xfrm_st=
ate *x, struct sk_buff *skb)
> >
> >         skb_reset_network_header(skb);
> >         skb_mac_header_rebuild(skb);
> > -       if (skb->mac_len)
> > +       if (skb_mac_header_was_set(skb) && skb->mac_len)
> >                 eth_hdr(skb)->h_proto =3D skb->protocol;
> >
> >         err =3D 0;
> > diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
> > index 0313a43aa..41af72a92 100644
> > --- a/net/xfrm/xfrm_iptfs.c
> > +++ b/net/xfrm/xfrm_iptfs.c
> > @@ -1099,7 +1099,7 @@ static bool __input_process_payload(struct xfrm_s=
tate *x, u32 data,
> >
> >                                 skb->protocol =3D protocol;
> >                                 skb_mac_header_rebuild(skb);
> > -                               if (skb->mac_len)
> > +                               if (skb_mac_header_was_set(skb) && skb-=
>mac_len)
> >                                         eth_hdr(skb)->h_proto =3D skb->=
protocol;
> >
> >                                 /* all pointers could be changed now re=
set walk */
> > --
> > 2.34.1
>
> I think you are fixing the wrong layer.
>
> I would have used something more generic.
>
> net: clear skb->mac_len in skb_unset_mac_header()
>
> skb_unset_mac_header() marks the mac header as unset but leaves
> skb->mac_len alone, so an skb can end up with no mac header and a
> non-zero mac_len. Code that uses mac_len to decide whether a mac
> header is present is then misled.
>
> end_dt_vrf_rcv() (SRv6 End.DT4/End.DT6) unsets the mac header of the
> decapsulated packet so that the VRF device can rebuild it. The VRF
> device only does so when a packet sniffer is attached, so without one
> the skb continues up the stack with mac_len =3D=3D 14. In
> xfrm4_remove_tunnel_encap() and xfrm6_remove_tunnel_encap(),
> skb_mac_header_rebuild() is a no-op for such an skb, and the following
>
>         if (skb->mac_len)
>                 eth_hdr(skb)->h_proto =3D skb->protocol;
>
> writes two bytes at skb->head + 0xffff + offsetof(struct ethhdr, h_proto)=
:
>
>   BUG: KASAN: slab-out-of-bounds in xfrm4_remove_tunnel_encap+0x17d/0x220
>   Write of size 2 at addr ffff88805f85800b by task syz-executor/10831
>    xfrm4_remove_tunnel_encap
>    xfrm_input
>    xfrm4_esp_rcv
>    ip_protocol_deliver_rcu
>    ip_local_deliver_finish
>    seg6_local_input_core
>    lwtunnel_input
>    __netif_receive_skb
>    netif_receive_skb
>    tun_rx_batched
>    tun_get_user
>
> Clear mac_len in skb_unset_mac_header() so that all callers leave the
> skb in a consistent state, and remove the now redundant assignment in
> skb_carve_reset_headers(). The other callers are on egress paths
> (__bpf_redirect_neigh(), bpf_lwt_push_ip_encap()) or only reach the
> helper when the mac header was already unset (bpf_update_srh_state()),
> and do not read mac_len afterwards.
>
> The issue was reported on the list by Piyus Kedia and Kapil Vaswani,
> who found it by fuzzing with AI assistance and reproduced the KASAN
> splat on v7.4-rc3. Their reproducer was not published, so this patch
> is build tested only.
>
> Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
> Reported-by: Piyus Kedia <piyus@iiitd.ac.in>
> Reported-by: Kapil Vaswani <kapil@presceralabs.ai>
> Closes: https://lore.kernel.org/netdev/20261116174531.2540348-2-piyus@iii=
td.ac.in/
> Signed-off-by: Eric Dumazet <edumazet@kernel.org>
>
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 6787fcf6ac3e43fe87fa5f9007b6d99f7aea0b44..9cd8eff0309cc3a646dc49e83=
a0cea79512cf8f5
> 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -3186,6 +3186,7 @@ static inline u32 skb_mac_header_len(const
> struct sk_buff *skb)
>  static inline void skb_unset_mac_header(struct sk_buff *skb)
>  {
>         skb->mac_header =3D (typeof(skb->mac_header))~0U;
> +       skb->mac_len =3D 0;
>  }
>
>  static inline void skb_reset_mac_header(struct sk_buff *skb)
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 1ac1e327ac4c6258726efaba346297ccbec7eef4..8fe0938d6131031a33b535fdf=
60d9eec50041ea4
> 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -6984,7 +6984,6 @@ static void skb_carve_reset_headers(struct sk_buff =
*skb)
>         skb_unset_mac_header(skb);
>         skb_unset_transport_header(skb);
>         skb_reset_network_header(skb);
> -       skb->mac_len =3D 0;
>
>         /* Inner offsets have no "unset" marker, zero them so that
>          * skb_inner_network_header_was_set() becomes false and no
