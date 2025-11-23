#!/usr/bin/env python3

"""
# lint.py

Lint all Conway-Markdown (CMD) source files, with automatic indexing.
"""

import json
import os
import re
import sys
from collections import defaultdict
from typing import Iterable, Optional, TypeVar

T1 = TypeVar('T1')
T2 = TypeVar('T2')
T3 = TypeVar('T3')

CANTONESE_TONES_CHINESE = ['陰平', '陰上', '陰去', '陽平', '陽上', '陽去', '高陰入', '低陰入', '陽入']
CJK_UNIFIED_IDEOGRAPH_RADICALS = (
    '一丨丶丿乙亅'
    '二亠人儿入八冂冖冫几凵刀力勹匕匚匸十卜卩厂厶又'
    '口囗土士夂夊夕大女子宀寸小尢尸屮山巛工己巾干幺广廴廾弋弓彐彡彳'
    '心戈戶手支攴文斗斤方无日曰月木欠止歹殳毋比毛氏气水火爪父爻爿片牙牛犬'
    '玄玉瓜瓦甘生用田疋疒癶白皮皿目矛矢石示禸禾穴立'
    '竹米糸缶网羊羽老而耒耳聿肉臣自至臼舌舛舟艮色艸虍虫血行衣襾'
    '見角言谷豆豕豸貝赤走足身車辛辰辵邑酉釆里'
    '金長門阜隶隹雨靑非'
    '面革韋韭音頁風飛食首香'
    '馬骨高髟鬥鬯鬲鬼'
    '魚鳥鹵鹿麥麻'
    '黃黍黑黹'
    '黽鼎鼓鼠'
    '鼻齊'
    '齒'
    '龍龜'
    '龠'
)
KANGXI_RADICALS = ''.join(chr(code_point) for code_point in range(0x2F00, 0x2FD6))
TONELESS_JYUTPING_LIST_FROM_WILLIAMS = {
    "'m": ['m'],
    "'ng": ['ng'],
    "(a/)": ['aa'],
    "(a/)i": ['aai'],
    "(a/)k": ['aak'],
    "(a/)m": ['aam'],
    "(a/)n": ['aan'],
    "(a/)ng": ['aang'],
    "(a/)p": ['aap'],
    "(a/)t": ['aat'],
    "(a/)u": ['aau'],
    "(e/)": ['e'],
    "(i/)": ['ji'],
    "(i/)m": ['jim'],
    "(i/)n": ['jin'],
    "(i/)p": ['jip'],
    "(i/)t": ['jit'],
    "(o\\)": ['ou'],
    "(o\\)m": ['am'],
    "(o\\)p": ['ap'],
    "(u/)": ['wu'],
    "(u/)i": ['wui'],
    "(u/)n": ['wun'],
    "(u/)t": ['wut'],
    "(u:)": ['jyu'],
    "(u:)n": ['jyun'],
    "(u:)t": ['jyut'],
    "ai": ['ai'],
    "ak": ['ak'],
    "am": ['am'],
    "ang": ['ang'],
    "ap": ['ap'],
    "at": ['at'],
    "au": ['au'],
    "ch(')(a/)": ['caa'],
    "ch(')(a/)i": ['caai'],
    "ch(')(a/)k": ['caak'],
    "ch(')(a/)m": ['caam'],
    "ch(')(a/)n": ['caan'],
    "ch(')(a/)ng": ['caang'],
    "ch(')(a/)p": ['caap'],
    "ch(')(a/)t": ['caat'],
    "ch(')(a/)u": ['caau'],
    "ch(')(e/)": ['ce'],
    "ch(')(e/)uk": ['coek'],
    "ch(')(e/)ung": ['coeng'],
    "ch(')(i/)": ['ci'],
    "ch(')(i/)m": ['cim'],
    "ch(')(i/)n": ['cin'],
    "ch(')(i/)t": ['cit'],
    "ch(')(u:)": ['ceoi', 'cyu'],
    "ch(')(u:)n": ['cyun'],
    "ch(')ak": ['cak'],
    "ch(')am": ['cam'],
    "ch(')an": ['can'],
    "ch(')ang": ['cang'],
    "ch(')au": ['cau'],
    "ch(')ek": ['cek'],
    "ch(')i(u/)": ['ciu'],
    "ch(')ik": ['cik'],
    "ch(')ing": ['cing'],
    "ch(')o": ['co'],
    "ch(')ok": ['cok'],
    "ch(')ong": ['cong'],
    "ch(')ui": ['ceoi'],
    "ch(')uk": ['cuk'],
    "ch(')un": ['ceon'],
    "ch(')ung": ['cung'],
    "ch(')ut": ['ceot'],
    "ch(a/)": ['zaa'],
    "ch(a/)i": ['zaai'],
    "ch(a/)k": ['zaak'],
    "ch(a/)m": ['zaam'],
    "ch(a/)n": ['zaan'],
    "ch(a/)ng": ['zaang'],
    "ch(a/)p": ['zaap'],
    "ch(a/)t": ['zaat'],
    "ch(a/)u": ['zaau'],
    "ch(e/)": ['ze'],
    "ch(e/)uk": ['zoek'],
    "ch(e/)ung": ['zoeng'],
    "ch(i/)": ['zi'],
    "ch(i/)m": ['zim'],
    "ch(i/)n": ['zin'],
    "ch(i/)p": ['zip'],
    "ch(i/)t": ['zit'],
    "ch(u:)": ['zyu'],
    "ch(u:)n": ['zyun'],
    "ch(u:)t": ['zyut'],
    "ch(u\\)": ['zoe'],
    "chai": ['zai'],
    "chak": ['zak'],
    "cham": ['zam'],
    "chan": ['zan'],
    "chang": ['zang'],
    "chap": ['zap'],
    "chat": ['zat'],
    "chau": ['zau'],
    "chek": ['zek'],
    "cheng": ['zeng'],
    "chi(u/)": ['ziu'],
    "chik": ['zik'],
    "ching": ['zing'],
    "cho": ['zo'],
    "chok": ['zok'],
    "chong": ['zong'],
    "chui": ['zeoi'],
    "chuk": ['zuk'],
    "chun": ['zeon'],
    "chung": ['zung'],
    "chut": ['zeot'],
    "f(a/)": ['faa'],
    "f(a/)i": ['faai'],
    "f(a/)k": ['faak'],
    "f(a/)n": ['faan'],
    "f(a/)t": ['faat'],
    "f(e/)": ['fe'],
    "f(i/)": ['fei'],
    "f(i/)t": ['fit'],
    "f(u/)": ['fu'],
    "f(u/)i": ['fui'],
    "f(u/)n": ['fun'],
    "f(u/)t": ['fut'],
    "fai": ['fai'],
    "fan": ['fan'],
    "fat": ['fat'],
    "fau": ['fau'],
    "fik": ['fik'],
    "fing": ['fing'],
    "fo": ['fo'],
    "fok": ['fok'],
    "fong": ['fong'],
    "fuk": ['fuk'],
    "fung": ['fung'],
    "h(a/)": ['haa'],
    "h(a/)i": ['haai'],
    "h(a/)k": ['haak'],
    "h(a/)m": ['haam'],
    "h(a/)n": ['haan'],
    "h(a/)ng": ['haang'],
    "h(a/)p": ['haap'],
    "h(a/)u": ['haau'],
    "h(e/)": ['he'],
    "h(e/)ung": ['hoeng'],
    "h(i/)": ['hei'],
    "h(i/)m": ['him'],
    "h(i/)n": ['hin'],
    "h(i/)p": ['hip'],
    "h(i/)t": ['hit'],
    "h(o\\)": ['hou'],
    "h(o\\)m": ['ham'],
    "h(o\\)p": ['hap'],
    "h(u:)": ['heoi'],
    "h(u:)n": ['hyun'],
    "h(u:)t": ['hyut'],
    "h(u\\)": ['hoe'],
    "hai": ['hai'],
    "hak": ['hak'],
    "ham": ['ham'],
    "han": ['han'],
    "hang": ['hang'],
    "hap": ['hap'],
    "hat": ['hat'],
    "hau": ['hau'],
    "hek": ['hek'],
    "heng": ['heng'],
    "hi(u/)": ['hiu'],
    "hing": ['hing'],
    "ho": ['ho'],
    "hoi": ['hoi'],
    "hok": ['hok'],
    "hon": ['hon'],
    "hong": ['hong'],
    "hot": ['hot'],
    "huk": ['huk'],
    "hung": ['hung'],
    "i(u/)": ['jiu'],
    "k(')(a/)": ['kaa'],
    "k(')(a/)i": ['kaai'],
    "k(')(a/)n": ['kaan'],
    "k(')(a/)t": ['kaat'],
    "k(')(a/)u": ['kaau'],
    "k(')(e/)": ['ke'],
    "k(')(e/)uk": ['koek'],
    "k(')(e/)ung": ['koeng'],
    "k(')(i/)": ['kei'],
    "k(')(i/)m": ['kim'],
    "k(')(i/)n": ['kin'],
    "k(')(i/)t": ['kit'],
    "k(')(u/)": ['ku'],
    "k(')(u/)i": ['kui'],
    "k(')(u/)t": ['kut'],
    "k(')(u:)": ['keoi'],
    "k(')(u:)n": ['kyun'],
    "k(')(u:)t": ['kyut'],
    "k(')ai": ['kai'],
    "k(')ak": ['kak'],
    "k(')am": ['kam'],
    "k(')an": ['kan'],
    "k(')ang": ['kang'],
    "k(')ap": ['kap'],
    "k(')at": ['kat'],
    "k(')au": ['kau'],
    "k(')ek": ['kek'],
    "k(')i(u/)": ['kiu'],
    "k(')ik": ['kik'],
    "k(')ing": ['king'],
    "k(')oi": ['koi'],
    "k(')ok": ['kok'],
    "k(')ong": ['kong'],
    "k(')uk": ['kuk'],
    "k(')ung": ['kung'],
    "k(a/)": ['gaa'],
    "k(a/)i": ['gaai'],
    "k(a/)k": ['gaak'],
    "k(a/)m": ['gaam'],
    "k(a/)n": ['gaan'],
    "k(a/)ng": ['gaang'],
    "k(a/)p": ['gaap'],
    "k(a/)t": ['gaat'],
    "k(a/)u": ['gaau'],
    "k(e/)": ['ge'],
    "k(e/)uk": ['goek'],
    "k(e/)ung": ['goeng'],
    "k(i/)": ['gei'],
    "k(i/)m": ['gim'],
    "k(i/)n": ['gin'],
    "k(i/)p": ['gip'],
    "k(i/)t": ['git'],
    "k(o\\)": ['gou'],
    "k(o\\)m": ['gam'],
    "k(o\\)p": ['gap'],
    "k(u/)": ['gu'],
    "k(u/)i": ['gui'],
    "k(u/)n": ['gun'],
    "k(u/)t": ['gut'],
    "k(u:)": ['geoi'],
    "k(u:)n": ['gyun'],
    "k(u:)t": ['gyut'],
    "k(u\\)": ['goe'],
    "kai": ['gai'],
    "kam": ['gam'],
    "kan": ['gan'],
    "kang": ['gang'],
    "kap": ['gap'],
    "kat": ['gat'],
    "kau": ['gau'],
    "keng": ['geng'],
    "ki(u/)": ['giu'],
    "kik": ['gik'],
    "king": ['ging'],
    "ko": ['go'],
    "koi": ['goi'],
    "kok": ['gok'],
    "kon": ['gon'],
    "kong": ['gong'],
    "kot": ['got'],
    "kuk": ['guk'],
    "kung": ['gung'],
    "kw(')(a/)": ['kwaa'],
    "kw(')(a/)ng": ['kwaang'],
    "kw(')ai": ['kwai'],
    "kw(')an": ['kwan'],
    "kw(')ik": ['kwik'],
    "kw(')ok": ['kwok'],
    "kw(')ong": ['kwong'],
    "kw(a/)": ['gwaa'],
    "kw(a/)i": ['gwaai'],
    "kw(a/)k": ['gwaak'],
    "kw(a/)n": ['gwaan'],
    "kw(a/)ng": ['gwaang'],
    "kw(a/)t": ['gwaat'],
    "kw(i/)t": ['gwit'],
    "kwai": ['gwai'],
    "kwan": ['gwan'],
    "kwang": ['gwang'],
    "kwat": ['gwat'],
    "kwik": ['gwik'],
    "kwing": ['gwing'],
    "kwo": ['gwo'],
    "kwok": ['gwok'],
    "kwong": ['gwong'],
    "l(a/)": ['laa'],
    "l(a/)i": ['laai'],
    "l(a/)k": ['laak'],
    "l(a/)m": ['laam'],
    "l(a/)n": ['laan'],
    "l(a/)ng": ['laang'],
    "l(a/)p": ['laap'],
    "l(a/)t": ['laat'],
    "l(a/)u": ['laau'],
    "l(e/)": ['le'],
    "l(e/)m": ['lem'],
    "l(e/)uk": ['loek'],
    "l(e/)ung": ['loeng'],
    "l(i/)": ['lei'],
    "l(i/)m": ['lim'],
    "l(i/)n": ['lin'],
    "l(i/)p": ['lip'],
    "l(i/)t": ['lit'],
    "l(o\\)": ['lou'],
    "l(u/)i": ['leoi'],
    "l(u:)": ['leoi'],
    "l(u:)n": ['lyun'],
    "l(u:)t": ['lyut'],
    "l(u\\)": ['loe'],
    "lai": ['lai'],
    "lak": ['lak'],
    "lam": ['lam'],
    "lan": ['lan'],
    "lang": ['lang'],
    "lap": ['lap'],
    "lat": ['lat'],
    "lau": ['lau'],
    "lek": ['lek'],
    "leng": ['leng'],
    "li(u/)": ['liu'],
    "lik": ['lik'],
    "ling": ['ling'],
    "lo": ['lo'],
    "loi": ['loi'],
    "lok": ['lok'],
    "long": ['long'],
    "lui": ['leoi'],
    "luk": ['luk'],
    "lun": ['leon'],
    "lung": ['lung'],
    "lut": ['leot'],
    "m(a/)": ['maa'],
    "m(a/)i": ['maai'],
    "m(a/)k": ['maak'],
    "m(a/)n": ['maan'],
    "m(a/)ng": ['maang'],
    "m(a/)t": ['maat'],
    "m(a/)u": ['maau'],
    "m(e/)": ['me'],
    "m(i/)": ['mei'],
    "m(i/)n": ['min'],
    "m(i/)t": ['mit'],
    "m(o\\)": ['mou'],
    "m(u/)i": ['mui'],
    "m(u/)n": ['mun'],
    "m(u/)t": ['mut'],
    "mai": ['mai'],
    "mak": ['mak'],
    "man": ['man'],
    "mang": ['mang'],
    "mat": ['mat'],
    "mau": ['mau'],
    "mek": ['mek'],
    "meng": ['meng'],
    "mi(u/)": ['miu'],
    "mik": ['mik'],
    "ming": ['ming'],
    "mo": ['mo'],
    "mok": ['mok'],
    "mong": ['mong'],
    "muk": ['muk'],
    "mung": ['mung'],
    "n(a/)": ['naa'],
    "n(a/)i": ['naai'],
    "n(a/)m": ['naam'],
    "n(a/)n": ['naan'],
    "n(a/)p": ['naap'],
    "n(a/)t": ['naat'],
    "n(a/)u": ['naau'],
    "n(e/)": ['ne'],
    "n(e/)ung": ['noeng'],
    "n(i/)": ['nei', 'ni'],
    "n(i/)m": ['nim'],
    "n(i/)n": ['nin'],
    "n(i/)p": ['nip'],
    "n(o\\)": ['nou'],
    "n(u:)": ['neoi'],
    "n(u:)n": ['nyun'],
    "nai": ['nai'],
    "nak": ['nak'],
    "nam": ['nam'],
    "nan": ['nan'],
    "nang": ['nang'],
    "nap": ['nap'],
    "nat": ['nat'],
    "nau": ['nau'],
    "neng": ['neng'],
    "ng": ['ng'],
    "ng(a/)": ['ngaa'],
    "ng(a/)i": ['ngaai'],
    "ng(a/)k": ['ngaak'],
    "ng(a/)m": ['ngaam'],
    "ng(a/)n": ['ngaan'],
    "ng(a/)ng": ['ngaang'],
    "ng(a/)p": ['ngaap'],
    "ng(a/)t": ['ngaat'],
    "ng(a/)u": ['ngaau'],
    "ng(e/)": ['nge'],
    "ng(i/)": ['ngi'],
    "ng(i/)t": ['ngit'],
    "ng(o\\)": ['ngou'],
    "ngai": ['ngai'],
    "ngak": ['ngak'],
    "ngam": ['ngam'],
    "ngan": ['ngan'],
    "ngap": ['ngap'],
    "ngat": ['ngat'],
    "ngau": ['ngau'],
    "ngo": ['ngo'],
    "ngoi": ['ngoi'],
    "ngok": ['ngok'],
    "ngon": ['ngon'],
    "ngong": ['ngong'],
    "ni(u/)": ['niu'],
    "nik": ['nik'],
    "ning": ['ning'],
    "no": ['no'],
    "noi": ['noi'],
    "nok": ['nok'],
    "nong": ['nong'],
    "nui": ['neoi'],
    "nuk": ['nuk'],
    "nung": ['nung'],
    "nut": ['neot'],
    "o": ['o'],
    "oi": ['oi'],
    "ok": ['ok'],
    "on": ['on'],
    "ong": ['ong'],
    "p(')(a/)": ['paa'],
    "p(')(a/)i": ['paai'],
    "p(')(a/)k": ['paak'],
    "p(')(a/)n": ['paan'],
    "p(')(a/)ng": ['paang'],
    "p(')(a/)u": ['paau'],
    "p(')(e/)": ['pe'],
    "p(')(i/)": ['pei'],
    "p(')(i/)n": ['pin'],
    "p(')(i/)t": ['pit'],
    "p(')(o\\)": ['pou'],
    "p(')(u/)i": ['pui'],
    "p(')(u/)n": ['pun'],
    "p(')(u/)t": ['put'],
    "p(')ai": ['pai'],
    "p(')ak": ['pak'],
    "p(')an": ['pan'],
    "p(')ang": ['pang'],
    "p(')at": ['pat'],
    "p(')au": ['pau'],
    "p(')ek": ['pek'],
    "p(')eng": ['peng'],
    "p(')i(u/)": ['piu'],
    "p(')ik": ['pik'],
    "p(')ing": ['ping'],
    "p(')o": ['po'],
    "p(')ok": ['pok'],
    "p(')ong": ['pong'],
    "p(')uk": ['puk'],
    "p(')ung": ['pung'],
    "p(a/)": ['baa'],
    "p(a/)i": ['baai'],
    "p(a/)k": ['baak'],
    "p(a/)n": ['baan'],
    "p(a/)ng": ['baang'],
    "p(a/)t": ['baat'],
    "p(a/)u": ['baau'],
    "p(e/)": ['be'],
    "p(i/)": ['bei'],
    "p(i/)n": ['bin'],
    "p(i/)t": ['bit'],
    "p(o\\)": ['bou'],
    "p(o\\)m": ['bam'],
    "p(o\\)p": ['bup'],
    "p(u/)i": ['bui'],
    "p(u/)n": ['bun'],
    "p(u/)t": ['but'],
    "pai": ['bai'],
    "pak": ['bak'],
    "pan": ['ban'],
    "pang": ['bang'],
    "pat": ['bat'],
    "pau": ['bau'],
    "peng": ['beng'],
    "pi(u/)": ['biu'],
    "pik": ['bik'],
    "ping": ['bing'],
    "po": ['bo'],
    "pok": ['bok'],
    "pong": ['bong'],
    "puk": ['buk'],
    "pung": ['bung'],
    "s(a/)": ['saa'],
    "s(a/)i": ['saai'],
    "s(a/)m": ['saam'],
    "s(a/)n": ['saan'],
    "s(a/)p": ['saap'],
    "s(a/)t": ['saat'],
    "s(e/)": ['se'],
    "s(e/)uk": ['soek'],
    "s(e/)ung": ['soeng'],
    "s(i/)n": ['sin'],
    "s(i/)p": ['sip'],
    "s(i/)t": ['sit'],
    "s(o\\)": ['sou'],
    "s(u/)": ['sou'],
    "s(u:)": ['seoi'],
    "s(u:)n": ['syun'],
    "s(u:)t": ['syut'],
    "s(u\\)": ['soe'],
    "sai": ['sai'],
    "sak": ['sak'],
    "sam": ['sam'],
    "san": ['san'],
    "sang": ['sang'],
    "sap": ['sap'],
    "sat": ['sat'],
    "sau": ['sau'],
    "sek": ['sek'],
    "seng": ['seng'],
    "sh(a/)": ['saa'],
    "sh(a/)i": ['saai'],
    "sh(a/)k": ['saak'],
    "sh(a/)m": ['saam'],
    "sh(a/)n": ['saan'],
    "sh(a/)ng": ['saang'],
    "sh(a/)p": ['saap'],
    "sh(a/)t": ['saat'],
    "sh(a/)u": ['saau'],
    "sh(e/)": ['se'],
    "sh(e/)uk": ['soek'],
    "sh(e/)ung": ['soeng'],
    "sh(i/)": ['si'],
    "sh(i/)m": ['sim'],
    "sh(i/)n": ['sin'],
    "sh(i/)p": ['sip'],
    "sh(i/)t": ['sit'],
    "sh(o\\)": ['sou'],
    "sh(u:)": ['syu'],
    "sh(u:)n": ['syun'],
    "sh(u:)t": ['syut'],
    "shai": ['sai'],
    "sham": ['sam'],
    "shan": ['san'],
    "shang": ['sang'],
    "shap": ['sap'],
    "shat": ['sat'],
    "shau": ['sau'],
    "shek": ['sek'],
    "sheng": ['seng'],
    "shi(u/)": ['siu'],
    "shik": ['sik'],
    "shing": ['sing'],
    "sho": ['so'],
    "shok": ['sok'],
    "shong": ['song'],
    "shui": ['seoi'],
    "shuk": ['suk'],
    "shun": ['seon'],
    "shung": ['sung'],
    "shut": ['seot'],
    "si(u/)": ['siu'],
    "sik": ['sik'],
    "sing": ['sing'],
    "so": ['so'],
    "soi": ['soi'],
    "sok": ['sok'],
    "song": ['song'],
    "sui": ['seoi'],
    "suk": ['suk'],
    "sun": ['seon'],
    "sung": ['sung'],
    "sut": ['seot'],
    "sz'": ['sei', 'si'],
    "t(')(a/)": ['taa'],
    "t(')(a/)i": ['taai'],
    "t(')(a/)m": ['taam'],
    "t(')(a/)n": ['taan'],
    "t(')(a/)p": ['taap'],
    "t(')(a/)t": ['taat'],
    "t(')(i/)m": ['tim'],
    "t(')(i/)n": ['tin'],
    "t(')(i/)p": ['tip'],
    "t(')(i/)t": ['tit'],
    "t(')(o\\)": ['tou'],
    "t(')(u/)i": ['teoi'],
    "t(')(u:)n": ['tyun'],
    "t(')(u:)t": ['tyut'],
    "t(')(u\\)": ['toe'],
    "t(')ai": ['tai'],
    "t(')am": ['tam'],
    "t(')an": ['tan'],
    "t(')ang": ['tang'],
    "t(')ap": ['tap'],
    "t(')au": ['tau'],
    "t(')ek": ['tek'],
    "t(')eng": ['teng'],
    "t(')i(u/)": ['tiu'],
    "t(')ik": ['tik'],
    "t(')ing": ['ting'],
    "t(')o": ['to'],
    "t(')oi": ['toi'],
    "t(')ok": ['tok'],
    "t(')ong": ['tong'],
    "t(')uk": ['tuk'],
    "t(')un": ['teon'],
    "t(')ung": ['tung'],
    "t(a/)": ['daa'],
    "t(a/)i": ['daai'],
    "t(a/)m": ['daam'],
    "t(a/)n": ['daan'],
    "t(a/)ng": ['daang'],
    "t(a/)p": ['daap'],
    "t(a/)t": ['daat'],
    "t(e/)": ['de'],
    "t(e/)uk": ['doek'],
    "t(e/)ung": ['doeng'],
    "t(i/)": ['dei', 'di'],
    "t(i/)m": ['dim'],
    "t(i/)n": ['din'],
    "t(i/)p": ['dip'],
    "t(i/)t": ['dit'],
    "t(o\\)": ['dou'],
    "t(o\\)m": ['dam'],
    "t(u/)i": ['deoi'],
    "t(u:)n": ['dyun'],
    "t(u:)t": ['dyut'],
    "t(u\\)": ['doe'],
    "tai": ['dai'],
    "tak": ['dak'],
    "tam": ['dam'],
    "tan": ['dan'],
    "tang": ['dang'],
    "tap": ['dap'],
    "tat": ['dat'],
    "tau": ['dau'],
    "tek": ['dek'],
    "teng": ['deng'],
    "ti(u/)": ['diu'],
    "tik": ['dik'],
    "ting": ['ding'],
    "to": ['do'],
    "toi": ['doi'],
    "tok": ['dok'],
    "tong": ['dong'],
    "ts(')(a/)k": ['caak'],
    "ts(')(a/)m": ['caam'],
    "ts(')(a/)n": ['caan'],
    "ts(')(a/)t": ['caat'],
    "ts(')(e/)": ['ce'],
    "ts(')(e/)uk": ['coek'],
    "ts(')(e/)ung": ['coeng'],
    "ts(')(i/)m": ['cim'],
    "ts(')(i/)n": ['cin'],
    "ts(')(i/)p": ['cip'],
    "ts(')(i/)t": ['cit'],
    "ts(')(o\\)": ['cou'],
    "ts(')(u/)i": ['ceoi'],
    "ts(')(u:)": ['ceoi'],
    "ts(')(u:)n": ['cyun'],
    "ts(')(u:)t": ['cyut'],
    "ts(')ai": ['cai'],
    "ts(')am": ['cam'],
    "ts(')an": ['can'],
    "ts(')ang": ['cang'],
    "ts(')ap": ['cap'],
    "ts(')at": ['cat'],
    "ts(')au": ['cau'],
    "ts(')ek": ['cek'],
    "ts(')eng": ['ceng'],
    "ts(')i(u/)": ['ciu'],
    "ts(')ik": ['cik'],
    "ts(')ing": ['cing'],
    "ts(')o": ['co'],
    "ts(')oi": ['coi'],
    "ts(')ok": ['cok'],
    "ts(')ong": ['cong'],
    "ts(')ui": ['ceoi'],
    "ts(')uk": ['cuk'],
    "ts(')un": ['ceon'],
    "ts(')ung": ['cung'],
    "ts(')z'": ['ci'],
    "ts(a/)": ['zaa'],
    "ts(a/)k": ['zaak'],
    "ts(a/)m": ['zaam'],
    "ts(a/)n": ['zaan'],
    "ts(a/)p": ['zaap'],
    "ts(a/)t": ['zaat'],
    "ts(e/)": ['ze'],
    "ts(e/)uk": ['zoek'],
    "ts(e/)ung": ['zoeng'],
    "ts(i/)m": ['zim'],
    "ts(i/)n": ['zin'],
    "ts(i/)p": ['zip'],
    "ts(i/)t": ['zit'],
    "ts(o\\)": ['zou'],
    "ts(u/)": ['zou'],
    "ts(u/)i": ['zeoi'],
    "ts(u:)": ['zeoi'],
    "ts(u:)n": ['zyun'],
    "ts(u:)t": ['zyut'],
    "tsai": ['zai'],
    "tsak": ['zak'],
    "tsam": ['zam'],
    "tsang": ['zang'],
    "tsap": ['zap'],
    "tsat": ['zat'],
    "tsau": ['zau'],
    "tsek": ['zek'],
    "tseng": ['zeng'],
    "tsi(u/)": ['ziu'],
    "tsik": ['zik'],
    "tsing": ['zing'],
    "tso": ['zo'],
    "tsoi": ['zoi'],
    "tsok": ['zok'],
    "tsong": ['zong'],
    "tsui": ['zeoi'],
    "tsuk": ['zuk'],
    "tsun": ['zeon'],
    "tsung": ['zung'],
    "tsut": ['zeot'],
    "tsz'": ['zi'],
    "tui": ['deoi'],
    "tuk": ['duk'],
    "tun": ['deon'],
    "tung": ['dung'],
    "tut": ['deot'],
    "uk": ['uk'],
    "ung": ['ung'],
    "w(a/)": ['waa'],
    "w(a/)i": ['waai'],
    "w(a/)k": ['waak'],
    "w(a/)n": ['waan'],
    "w(a/)ng": ['waang'],
    "w(a/)t": ['waat'],
    "w(i/)t": ['wit'],
    "wai": ['wai'],
    "wan": ['wan'],
    "wang": ['wang'],
    "wat": ['wat'],
    "wik": ['wik'],
    "wing": ['wing'],
    "wo": ['wo'],
    "wok": ['wok'],
    "wong": ['wong'],
    "y(a/)": ['jaa'],
    "y(a/)k": ['jaak'],
    "y(a/)ng": ['jaang'],
    "y(e/)": ['je'],
    "y(e/)uk": ['joek'],
    "y(e/)ung": ['joeng'],
    "yai": ['jai'],
    "yam": ['jam'],
    "yan": ['jan'],
    "yap": ['jap'],
    "yat": ['jat'],
    "yau": ['jau'],
    "yet": ['jet'],
    "yik": ['jik'],
    "ying": ['jing'],
    "yui": ['jeoi'],
    "yuk": ['juk'],
    "yun": ['jeon'],
    "yung": ['jung'],
}


class Utilities:
    @staticmethod
    def flatten_nested_list(nested_list: list) -> Iterable:
        for element in nested_list:
            if isinstance(element, list):
                yield from Utilities.flatten_nested_list(element)
            else:
                yield element

    @staticmethod
    def nested_newline_join(nested_list: list) -> str:
        return '\n'.join(Utilities.flatten_nested_list(nested_list))

    @staticmethod
    def literal_replacement_pattern(content: str) -> str:
        return content.replace('\\', r'\\')

    @staticmethod
    def unicode_code_point(character: str) -> str:
        return f'U+{ord(character):X}'

    @staticmethod
    def collate_firsts_by_second(pairs: Iterable[tuple[T1, T2]]) -> dict[T2, list[T1]]:
        firsts_from_second: dict[T2, list[T1]] = defaultdict(list)

        for first, second in pairs:
            firsts_from_second[second].append(first)

        return dict(firsts_from_second)

    @staticmethod
    def collate_first_by_second_by_third(triples: Iterable[tuple[T1, T2, T3]]) -> dict[T3, dict[T2, T1]]:
        first_from_second_from_third: dict[T3, dict[T2, T1]] = defaultdict(dict)

        for first, second, third in triples:
            first_from_second_from_third[third][second] = first

        return dict(first_from_second_from_third)

    @staticmethod
    def nice_json_string(object_, newline_after: str) -> str:
        return (
            json.dumps(object_, ensure_ascii=False, separators=(',', ':'))
            .replace(newline_after, f'{newline_after}\n')
            + '\n'
        )


class CmdIdioms:
    @staticmethod
    def strip_comments(content: str) -> str:
        return re.sub(
            pattern=r'< (?P<hashes> \#+ ) .*? (?P=hashes) >',
            repl='',
            string=content,
            flags=re.DOTALL | re.VERBOSE,
        )

    @staticmethod
    def parse_entry_items(content: str) -> dict[str, str]:
        return {
            key: content
            for match in re.finditer(
                pattern=r'^ (?P<key>\S+) \n (?P<content> (?: [ ].*\n )* )',
                string=content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                key := match.group('key'),
                content := match.group('content'),
            )
        }

    @staticmethod
    def strip_compositions(content: str) -> str:
        return re.sub(
            pattern=r'\{ (?P<character> \S ) = \S+? \}',
            repl=r'\g<character>',
            string=content,
            flags=re.VERBOSE
        )

    @staticmethod
    def lint_see_also_link_order(see_also_links: list[str]):
        if see_also_links is None:
            return

        if len(set(see_also_links)) < len(see_also_links):
            raise LintException(f'duplicates amongst see also links {see_also_links}')

        if see_also_links != sorted(see_also_links):
            raise LintException(f'see also links {see_also_links} not in sorted order')


class LintException(Exception):
    message: str

    def __init__(self, message: str):
        self.message = message


class CmdSource:
    file_name: str
    content: str
    todo_count: int
    entry_page: Optional['EntryPage']
    radical_page: Optional['RadicalPage']

    def __init__(self, file_name: str):
        with open(file_name, 'r', encoding='utf-8') as cmd_file:
            content = cmd_file.read()

        todo_count = content.count('TODO')

        try:
            CmdSource.lint_whitespace(content)
            CmdSource.lint_typography_quote(content)
            CmdSource.lint_cjk_compatibility_ideograph(content)
            CmdSource.lint_cjk_non_bmp_composition(content)
            CmdSource.lint_cjk_variation_selector(content)
            CmdSource.lint_insertion_deletion_context(content)
            CmdSource.lint_williams_entering_tone(content)
            CmdSource.lint_williams_left_tone_position(content)
            CmdSource.lint_williams_right_tone_position(content)
            CmdSource.lint_williams_initial_aspirate(content)
            CmdSource.lint_williams_tone_45_aspirate(content)
            CmdSource.lint_williams_tone_6_aspirate(content)
            CmdSource.lint_williams_diphthong(content)
            CmdSource.lint_williams_nasal_apostrophe(content)
            CmdSource.lint_williams_apical_apostrophe(content)
            CmdSource.lint_jyutping_entering_tone(content)
            CmdSource.lint_jyutping_yod(content)
            CmdSource.lint_romanisation_character_consistency(content)
        except LintException as lint_exception:
            print(f'Error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        if file_name.startswith('entries/') and not file_name.endswith('index.cmd'):
            entry_page = EntryPage(file_name, content)
        else:
            entry_page = None

        if file_name.startswith('radicals/') and not file_name.endswith('index.cmd'):
            radical_page = RadicalPage(file_name, content)
        else:
            radical_page = None

        self.file_name = file_name
        self.content = content
        self.todo_count = todo_count
        self.entry_page = entry_page
        self.radical_page = radical_page

    def index_self(self):
        if self.entry_page is not None:
            self.entry_page.index_self()

    def index_radicals(self, character_entries_from_radical_strokes: dict['RadicalStrokes', list['CharacterEntry']]):
        if self.radical_page is not None:
            self.radical_page.index(character_entries_from_radical_strokes)

    @staticmethod
    def lint_whitespace(content: str):
        # Fast elimination of negative cases
        if '\t' not in content:
            return

        if context_match := re.search(pattern=r'.*\t.*', string=content):
            context = context_match.group()
            raise LintException(f'tab character present in `{context}`')

    @staticmethod
    def lint_typography_quote(content: str):
        quotes = '‘’“”'

        # Fast elimination of negative cases
        if not any(quote in content for quote in quotes):
            return

        if context_match := re.search(
            pattern=fr'\S* (?P<quote>[{quotes}]) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            quote = context_match.group('quote')
            raise LintException(f'non-straight quote `{quote}` present in `{context}`')

    @staticmethod
    def lint_cjk_compatibility_ideograph(content: str):
        cjk_compatibility_ideograph_pattern = r'[\uF900-\uFAFF\U0002F800-\U0002FA1F]'

        # Fast elimination of negative cases
        if not re.search(pattern=cjk_compatibility_ideograph_pattern, string=content):
            return

        if context_match := re.search(
            pattern=fr'\S*? (?P<character> {cjk_compatibility_ideograph_pattern} ) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'compatibility ideograph `{character}` present in `{context}`')

    @staticmethod
    def lint_cjk_non_bmp_composition(content: str):
        whitelisted_primitives = '𠂉𠂢𠆢𠔿𠦄𠫓𡈼𤣩𥫗𦈢𦣝𦣞𦥑𧰼𧶠𧾷𨸏𩙿'
        exempt_pattern = '|'.join([
            r'\{ \S = \S+? \}',
            r'\# cantonese - [⺀-〿㇀-㇯㐀-鿿豈-龎！-｠𠀀-𳑿]+',
        ])
        non_exempt_content = re.sub(
            pattern=exempt_pattern,
            repl='',
            string=content,
            flags=re.VERBOSE,
        )

        for context_match in re.finditer(
            pattern=r'\S* (?P<character> [𠀀-𳑿] ) (?! [@^] ) \S*',
            string=non_exempt_content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')

            if character in whitelisted_primitives:
                continue

            raise LintException(
                f'missing composition for non-BMP ideograph `{character}` in `{context}` '
                f'(suppress with at (in run) or caret (alone) after character if legitimate)'
            )

    @staticmethod
    def lint_cjk_variation_selector(content: str):
        cjk_variation_selector_pattern = r'[\uFE00-\uFE0F]'

        # Fast elimination of negative cases
        if not re.search(pattern=cjk_variation_selector_pattern, string=content):
            return

        if context_match := re.search(
            pattern=fr'\S* (?P<character>.) {cjk_variation_selector_pattern} \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            context = context_match.group()
            character = context_match.group('character')
            raise LintException(f'variation selector present on `{character}` in `{context}`')

    @staticmethod
    def lint_insertion_deletion_context(content: str):
        insertion_deletion_markers = ['[[', '``', '<ins', '~~', '<del']

        # Fast elimination of negative cases (in `content`)
        if not any(marker in content for marker in insertion_deletion_markers):
            return

        exempt_pattern = '|'.join([
            r'< (?P<backticks> `+ ) (?s: .+? ) (?P=backticks) > ',  # literals
            r'< (?P<hashes> \#+ ) (?s: .+? ) (?P=hashes) > ',  # comments
            r'^ \# \{\.williams\} \s+ .*? \[\[ [a-z]+ \]\] $',  # page headings
            r'^ \#\# \{ \# [1-6] \s+ \.williams \} \s+ .*? \[\[ [a-z]+ [1-6] \s+ \S+ \]\] $',  # tone headings
            r'^ [#]{3} [+]? [ ] \S+ [1-6] [ ][|][ ] .*? [ ] \[\[ [a-z]+[1-6] \]\] $',  # character entry headings
            r'^ (?: WH | WV | WP | W ) \n (?: [ ].*\n )*',  # Williams entry items
            r'''
                ^ (?P<block_delimiter> [-+='"|]{2,} ) \{ \.williams (?: \s .*? )? \} \n
                (?s: .*? ) \n
                (?P=block_delimiter) $
            ''',
            r'<span [ ] class="williams"> .*? </span>',
            re.escape('[[Not present]]'),  # contextual non-insertions
        ])
        non_exempt_content = re.sub(
            pattern=exempt_pattern,
            repl='',
            string=content,
            flags=re.MULTILINE | re.VERBOSE,
        )

        # Fast elimination of negative cases (in `non_exempt_content`)
        if not any(marker in non_exempt_content for marker in insertion_deletion_markers):
            return

        if insertion_context_match := re.search(
            pattern=r'.* (?: \[\[ | `` | <ins ) .*',
            string=non_exempt_content,
            flags=re.VERBOSE,
        ):
            insertion_context = insertion_context_match.group()
            raise LintException(f'non-contextual insertion in `{insertion_context}`')

        if deletion_context_match := re.search(
            pattern=r'.* (?: ~~ | <del ) .*',
            string=non_exempt_content,
            flags=re.VERBOSE,
        ):
            deletion_context = deletion_context_match.group()
            raise LintException(f'non-contextual deletion in `{deletion_context}`')

    @staticmethod
    def lint_williams_entering_tone(content: str):
        bad_entering_tone_pattern = r'[ptk] \([1-6]\)'

        # Fast elimination of negative cases
        if not re.search(pattern=bad_entering_tone_pattern, string=content, flags=re.VERBOSE):
            return

        if run_match := re.search(
            pattern=fr'\S+ {bad_entering_tone_pattern}',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams entering tone in `{run}`')

    @staticmethod
    def lint_williams_left_tone_position(content: str):
        # Fast elimination of negative cases
        if not re.search(pattern=r'[^_] \([1245]\) [_ ]', string=content, flags=re.VERBOSE):
            return

        if run_match := re.search(
            pattern=r'\S* (?<! _ ) \([1245]\) [_ ]',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams left-tone position in `{run}`')

    @staticmethod
    def lint_williams_right_tone_position(content: str):
        if run_match := re.search(
            pattern=r'[_ ] \([36789]\) (?! _ ) \S*',
            string=content,
            flags=re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'bad Williams right-tone position in `{run}`')

    @staticmethod
    def lint_williams_initial_aspirate(content: str):
        # Allowing false positive (in `two_characters_before`) is faster than using a negative lookbehind
        if run_match := re.search(
            pattern=r"\S* (?P<two_characters_before> .. ) \('\) \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            two_characters_before = run_match.group('two_characters_before')

            # Elimination of false positive cases
            if re.fullmatch(
                pattern=r'.p | .t | .k | kw | ts | ch | `` | .\^',
                string=two_characters_before,
                flags=re.DOTALL | re.IGNORECASE | re.VERBOSE,
            ):
                return

            raise LintException(f'bad Williams aspirate in `{run}` (suppress with caret before aspirate if legitimate)')

    @staticmethod
    def lint_williams_tone_45_aspirate(content: str):
        if run_match := re.search(
            pattern=r"\([45]\) (?: p | t(?!s) | k(?!w) | kw | ts | ch) (?! \('\) ) \S+",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'unaspirated Williams tone 4 or 5 in `{run}` (suppress with caret before initial if legitimate)'
            )

    @staticmethod
    def lint_williams_tone_6_aspirate(content: str):
        if run_match := re.search(
            pattern=r"(?: p | t | k | kw | ts | ch) \('\) (?! \^ ) \S+ \(6\)",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'aspirated Williams tone 6 in `{run}` (suppress with caret after aspirate if legitimate)'
            )

    @staticmethod
    def lint_williams_diphthong(content: str):
        # Fast elimination of negative cases
        if not any(diphthong in content.lower() for diphthong in ['(i/)u', 'u(i/)']):
            return

        if context_match := re.search(
            pattern=r"\S* (?P<diphthong> \(i/\)u | u\(i/\) ) \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            context = context_match.group()
            diphthong = context_match.group('diphthong')
            raise LintException(f'bad Williams diphthong `{diphthong}` present in `{context}`')

    @staticmethod
    def lint_williams_nasal_apostrophe(content: str):
        # Fast elimination of negative cases
        if not any(bad_syllable in content.lower() for bad_syllable in ["m'", "ng'"]):
            return

        if context_match := re.search(
            pattern=r"\S* (?: m | ng ) ' \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            context = context_match.group()
            raise LintException(
                f'wrong-side Williams nasal apostrophe in `{context}` '
                f'(suppress with caret before apostrophe if legitimate)'
            )

    @staticmethod
    def lint_williams_apical_apostrophe(content: str):
        # Fast elimination of negative cases
        if not re.search(pattern=r"sz [^'`^]", string=content.lower(), flags=re.IGNORECASE | re.VERBOSE):
            return

        if run_match := re.search(
            pattern=r"\S* sz [^'`^] \S*",
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(
                f'missing Williams apical apostrophe in `{run}` (suppress with caret after `sz` if legitimate)'
            )

    @staticmethod
    def lint_jyutping_entering_tone(content: str):
        if run_match := re.search(
            pattern=r'(?<! < ) \b [a-z]+ [789] \b',
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'unaliased entering tone number in Jyutping `{run}`')

    @staticmethod
    def lint_jyutping_yod(content: str):
        if run_match := re.search(
            pattern=r'\b y [a-z]* [1-6] \b',
            string=content,
            flags=re.IGNORECASE | re.VERBOSE,
        ):
            run = run_match.group()
            raise LintException(f'misspelt yod in Jyutping `{run}`')

    @staticmethod
    def lint_romanisation_character_consistency(content: str):
        for dual_romanisation_match in re.finditer(
            pattern=r'''
                _ (?P<williams> \S [^_\n]*? \S ) _
                \s+
                (?: \[\[ | \( )
                    (?P<jyutping_caret> \^? )
                    (?P<jyutping> [a-z1-6 ]+ )
                    (?P<character_content> [^a-z1-6 \]\)]*? )
                    (?P<character_caret> \^? )
                (?: \]\] | \) )
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            dual_romanisation = dual_romanisation_match.group()
            jyutping_caret = dual_romanisation_match.group('jyutping_caret')
            williams = dual_romanisation_match.group('williams').replace('-', ' ')
            jyutping = dual_romanisation_match.group('jyutping').strip()
            character_content = dual_romanisation_match.group('character_content')
            character_caret = dual_romanisation_match.group('character_caret')

            williams_list = williams.split()
            jyutping_list = jyutping.split()
            characters = CmdIdioms.strip_compositions(character_content)

            williams_count = len(williams_list)
            jyutping_count = len(jyutping_list)
            character_count = len(characters)

            dual_romanisation_reduced = re.sub(pattern=r'\s+', repl=' ', string=dual_romanisation)

            if character_count and jyutping_count != character_count and not character_caret:
                raise LintException(
                    f'inconsistent Jyutping count `{jyutping_count}` vs character count `{character_count}` '
                    f'in `{dual_romanisation_reduced}` '
                    f'(suppress with caret before closing bracket if characters are tone commentary)'
                )

            if jyutping_caret:
                continue

            if williams_count == jyutping_count:
                if inconsistency := CmdSource.get_first_romanisation_inconsistency(williams_list, jyutping_list):
                    raise LintException(
                        f'inconsistent Williams `{inconsistency.williams}` '
                        f'vs Jyutping `{inconsistency.jyutping}` (expected {inconsistency.expected_jyutping_list}) '
                        f'in `{dual_romanisation_reduced}` '
                        f'(suppress with caret after opening bracket if not Jyutping or if legitimate)'
                    )

                continue

            edited_williams_list = re.sub(pattern='~~.+?~~', repl='', string=williams).split()
            edited_williams_count = len(edited_williams_list)

            if edited_williams_count == jyutping_count:
                if inconsistency := CmdSource.get_first_romanisation_inconsistency(edited_williams_list, jyutping_list):
                    raise LintException(
                        f'inconsistent Williams {inconsistency.williams} '
                        f'vs Jyutping {inconsistency.jyutping} (expected {inconsistency.expected_jyutping_list}) '
                        f'in `{dual_romanisation_reduced}` '
                        f'(suppress with caret after opening bracket if not Jyutping or if legitimate)'
                    )

                continue

            if edited_williams_count != williams_count:
                edited_williams_parenthetical = f' (edited to `{edited_williams_count}`)'
            else:
                edited_williams_parenthetical = ''

            raise LintException(
                f'inconsistent Williams count `{williams_count}`{edited_williams_parenthetical} '
                f'vs Jyutping count `{jyutping_count}` '
                f'in `{dual_romanisation_reduced}` '
                f'(suppress with caret before closing bracket if content is not Jyutping)'
            )

    @staticmethod
    def get_first_romanisation_inconsistency(williams_list: list[str],
                                             jyutping_list: list[str]) -> Optional['RomanisationComparison']:
        for williams, jyutping in zip(williams_list, jyutping_list):
            if not (romanisation_comparison := RomanisationComparison(williams, jyutping)).is_consistent:
                return romanisation_comparison

        return None


class RomanisationComparison:
    williams: str
    jyutping: str
    expected_jyutping_list = list[str]
    is_consistent: bool

    def __init__(self, williams: str, jyutping: str):
        expected_jyutping_list = RomanisationComparison.compute_expected_jyutping_list(williams)
        is_consistent = jyutping in expected_jyutping_list

        self.williams = williams
        self.jyutping = jyutping
        self.expected_jyutping_list = expected_jyutping_list
        self.is_consistent = is_consistent

    @staticmethod
    def compute_expected_jyutping_list(williams: str) -> list[str]:
        williams_toneless = re.sub(
            pattern=r'\([1-9]\) | ~~ | `` | [,?!^]',
            repl='',
            string=williams.lower(),
            flags=re.VERBOSE,
        )
        williams_tone_number = re.sub(pattern='[^1-9]', repl='', string=williams)

        expected_jyutping_toneless_list = TONELESS_JYUTPING_LIST_FROM_WILLIAMS.get(williams_toneless, [])
        expected_jyutping_tone_number = williams_tone_number.translate(str.maketrans('789', '136'))

        return [
            expected_jyutping_toneless + expected_jyutping_tone_number
            for expected_jyutping_toneless in expected_jyutping_toneless_list
        ]


class EntryPage:
    file_name: str
    content: str
    is_done: bool
    page_title: str
    page_heading: 'PageHeading'
    page_entry: 'PageEntry'
    tone_navigator: 'ToneNavigator'
    tone_headings: list['ToneHeading']
    character_navigators: list['CharacterNavigator']
    character_entries: list['CharacterEntry']

    def __init__(self, file_name: str, content: str):
        is_done = '(Work in progress)' not in content

        try:
            page_title = EntryPage.extract_page_title(content)
            page_heading = PageHeading(content, file_name, page_title)
            page_entry = PageEntry(content, page_heading.jyutping)
            tone_navigator = ToneNavigator(content)
            tone_headings = EntryPage.extract_tone_headings(content, page_heading.jyutping)
            character_navigators = EntryPage.extract_character_navigators(content)
            character_entries = EntryPage.extract_character_entries(content, page_heading.jyutping)

            EntryPage.lint_tone_heading_order(tone_headings)
            EntryPage.lint_character_entry_order(character_entries)

            EntryPage.lint_page_heading_against_page_entry(page_heading, page_entry)
            EntryPage.lint_page_heading_against_tone_headings(page_heading, tone_headings)
            EntryPage.lint_tone_headings_against_character_navigators(tone_headings, character_navigators)
            EntryPage.lint_tone_headings_against_character_entries(tone_headings, character_entries, is_done)
        except LintException as lint_exception:
            print(f'Error in `{file_name}`: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.file_name = file_name
        self.content = content
        self.is_done = is_done
        self.page_title = page_title
        self.page_heading = page_heading
        self.page_entry = page_entry
        self.tone_navigator = tone_navigator
        self.tone_headings = tone_headings
        self.character_navigators = character_navigators
        self.character_entries = character_entries

    def index_self(self):
        new_content = content = self.content
        new_content = self._replace_tone_navigator(new_content)
        new_content = self._replace_character_navigators(new_content)

        if new_content == content:
            return

        with open(self.file_name, 'w', encoding='utf-8') as cmd_file:
            cmd_file.write(new_content)

        self.content = new_content

    def _replace_tone_navigator(self, content: str) -> str:
        if self.tone_navigator.content is None:
            return content

        tone_navigator_content_expected = Utilities.nested_newline_join([
            '<## tones ##>',
            '<nav class="sideways">',
            '=={.modern}',
            [
                f'- [{tone_heading.jyutping}](#{tone_heading.tone_number})'
                for tone_heading in self.tone_headings
            ],
            '==',
            '</nav>',
            '<## /tones ##>',
        ])

        return content.replace(self.tone_navigator.content, tone_navigator_content_expected)

    def _replace_character_navigators(self, content: str) -> str:
        new_content = content

        character_entries_from_tone_number = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.tone_number)
            for character_entry in self.character_entries
        )

        for character_navigator in self.character_navigators:
            tone_number = character_navigator.tone_number
            character_navigator_content_expected = Utilities.nested_newline_join([
                f'<## tone-{tone_number}-characters ##>',
                '<nav class="sideways">',
                '=={.modern}',
                [
                    f'- {character_entry.same_page_link()}'
                    for character_entry in character_entries_from_tone_number.get(tone_number, [])
                ],
                '==',
                '</nav>',
                f'<## /tone-{tone_number}-characters ##>',
            ])

            new_content = new_content.replace(character_navigator.content, character_navigator_content_expected)

        return new_content

    @staticmethod
    def extract_page_title(page_content: str) -> str:
        if not (match := re.search(
            pattern=r'^\* %title --> (?P<title>[a-z]+)$',
            string=page_content,
            flags=re.MULTILINE,
        )):
            raise LintException('page title not found')

        return match.group('title')

    @staticmethod
    def extract_tone_headings(page_content: str, page_heading_jyutping: str) -> list['ToneHeading']:
        return [
            ToneHeading(content, tone_number, williams_run, jyutping, chinese, page_heading_jyutping)
            for match in re.finditer(
                pattern=r'''
                    ^ \#\# \{ \# (?P<tone_number> [1-6] ) \s+ \.williams \}
                    \s+ (?P<williams_run> .*? )
                    \s* \[\[ (?P<jyutping> [a-z]+ [1-6] ) \s+ (?P<chinese> \S+ ) \]\] $
                ''',
                string=page_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                content := match.group(),
                tone_number := match.group('tone_number'),
                williams_run := match.group('williams_run'),
                jyutping := match.group('jyutping'),
                chinese := match.group('chinese'),
            )
        ]

    @staticmethod
    def extract_character_navigators(page_content: str) -> list['CharacterNavigator']:
        return [
            CharacterNavigator(content, tone_number)
            for match in re.finditer(
                pattern='<## tone-(?P<tone_number>[1-6])-characters ##>.*?<## /tone-(?P=tone_number)-characters ##>',
                string=page_content,
                flags=re.DOTALL | re.MULTILINE,
            )
            if (
                content := match.group(),
                tone_number := match.group('tone_number'),
            )
        ]

    @staticmethod
    def extract_character_entries(page_content: str, page_heading_jyutping: str) -> list['CharacterEntry']:
        return [
            CharacterEntry(heading_content, addition, character_run, tone_number, williams_run, jyutping, non_canonical,
                           entry_content, page_heading_jyutping)
            for match in re.finditer(
                pattern=r'''
                    ^ (?P<heading_content>
                        [#]{3} (?P<addition> [+]? ) [ ]
                        (?P<character_run> \S+ ) (?P<tone_number> [1-6] ) [ ][|][ ]
                        (?P<williams_run> .*? ) [ ] \[\[ (?P<jyutping> [a-z]+[1-6] ) \]\]
                    )
                    \n\n
                    ^ [$]{2} (?P<non_canonical> [.]? ) \n
                    (?P<entry_content> (?s: .+? ) )
                    ^ [$]{2} \n
                ''',
                string=page_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
            if (
                heading_content := match.group('heading_content'),
                addition := match.group('addition'),
                character_run := match.group('character_run'),
                tone_number := match.group('tone_number'),
                williams_run := match.group('williams_run'),
                jyutping := match.group('jyutping'),
                non_canonical := match.group('non_canonical'),
                entry_content := match.group('entry_content'),
            )
        ]

    @staticmethod
    def lint_tone_heading_order(tone_headings: list['ToneHeading']):
        tone_heading_numbers = [tone_heading.tone_number for tone_heading in tone_headings]
        if tone_heading_numbers != sorted(tone_heading_numbers):
            raise LintException(f'tone headings {tone_heading_numbers} not in sorted order')

    @staticmethod
    def lint_character_entry_order(character_entries: list['CharacterEntry']):
        characters = ''.join(character_entry.character for character_entry in character_entries)
        sorted_characters = ''.join(character_entry.character for character_entry in sorted(character_entries))
        if characters != sorted_characters:
            raise LintException(f'character entries {characters} not in sorted order (expected {sorted_characters})')

    @staticmethod
    def lint_page_heading_against_page_entry(page_heading: 'PageHeading', page_entry: 'PageEntry'):
        if page_entry.wh_williams_list is None:
            return

        if page_heading.williams_list != page_entry.wh_williams_list:
            raise LintException(
                f'inconsistent page heading Williams list {page_heading.williams_list} '
                f'vs page entry Williams list {page_entry.wh_williams_list}'
            )

    @staticmethod
    def lint_page_heading_against_tone_headings(page_heading: 'PageHeading', tone_headings: list['ToneHeading']):
        if not tone_headings:
            return

        page_heading_williams_set = set(page_heading.williams_list)
        tone_heading_williams_set = set(
            re.sub(pattern=r'\([1-9]\)', repl='', string=williams)
            for tone_heading in tone_headings
            for williams in tone_heading.williams_list
        )
        tone_heading_williams_set_supplemented = {*page_heading_williams_set, *tone_heading_williams_set}
        tone_heading_williams_set_redundant = set(
            f'``{williams}``'  # insertion is redundant if non-insertion is also present
            for williams in tone_heading_williams_set_supplemented
            if not re.fullmatch(pattern='``.+``', string=williams)
        )
        page_heading_williams_set_expected = (
            tone_heading_williams_set_supplemented  # need supplemented for WH implied headings
            .difference(tone_heading_williams_set_redundant)
        )

        if page_heading_williams_set != page_heading_williams_set_expected:
            raise LintException(
                f'inconsistent page heading Williams set {page_heading_williams_set} '
                f'vs tone heading Williams set {tone_heading_williams_set} + {page_heading_williams_set} '
                f'≡ {page_heading_williams_set_expected} (modulo redundant insertion)'
            )

    @staticmethod
    def lint_tone_headings_against_character_navigators(tone_headings: list['ToneHeading'],
                                                        character_navigators: list['CharacterNavigator']):
        tone_heading_tone_numbers = [
            tone_heading.tone_number
            for tone_heading in tone_headings
        ]
        character_navigator_tone_numbers = [
            character_navigator.tone_number
            for character_navigator in character_navigators
        ]

        if tone_heading_tone_numbers != character_navigator_tone_numbers:
            raise LintException(
                f'inconsistent tone heading tone numbers `{tone_heading_tone_numbers}` '
                f'vs character navigator tone numbers `{character_navigator_tone_numbers}`'
            )

    @staticmethod
    def lint_tone_headings_against_character_entries(tone_headings: list['ToneHeading'],
                                                     character_entries: list['CharacterEntry'], is_done: bool):
        if not is_done:
            return

        for tone_heading in tone_headings:
            tone_heading_williams_set = set(tone_heading.williams_list)
            character_entry_williams_set = set(
                (f'``{williams}``' if character_entry.is_added else williams).replace('^', '')
                for character_entry in character_entries
                if character_entry.tone_number == tone_heading.tone_number
                for williams in character_entry.williams_list
            )
            character_entry_williams_set_redundant = set(
                f'``{williams}``'  # insertion is redundant if non-insertion is also present
                for williams in character_entry_williams_set
                if not re.fullmatch(pattern='``.+``', string=williams)
            )
            tone_heading_williams_set_expected = (
                character_entry_williams_set
                .difference(character_entry_williams_set_redundant)
            )

            if tone_heading_williams_set != tone_heading_williams_set_expected:
                raise LintException(
                    f'inconsistent tone heading Williams set {tone_heading_williams_set} '
                    f'vs character entry Williams set {character_entry_williams_set} '
                    f'≡ {tone_heading_williams_set_expected} (modulo redundant insertion)'
                )


class RadicalPage:
    file_name: str
    content: str

    def __init__(self, file_name: str, content: str):
        self.file_name = file_name
        self.content = content

    def index(self, character_entries_from_radical_strokes: dict['RadicalStrokes', list['CharacterEntry']]):
        new_content = self.content
        new_content = self._replace_radical_tables(new_content, character_entries_from_radical_strokes)

        with open(self.file_name, 'w', encoding='utf-8') as cmd_file:
            cmd_file.write(new_content)

        self.content = new_content

    @staticmethod
    def _replace_radical_tables(content: str,
                                character_entries_from_radical_strokes: dict['RadicalStrokes', list['CharacterEntry']]
                                ) -> str:
        radical_strokes_list_from_radical = Utilities.collate_firsts_by_second(
            (radical_strokes, radical_strokes.radical)
            for radical_strokes in character_entries_from_radical_strokes.keys()
        )

        def replacement_function(match: re.Match[str]) -> str:
            radical = match.group('radical')
            radical_strokes_list = radical_strokes_list_from_radical.get(radical, [])
            character_entries_from_stroke_count = {
                radical_strokes.stroke_count: character_entries_from_radical_strokes[radical_strokes]
                for radical_strokes in sorted(radical_strokes_list)
            }

            return Utilities.nested_newline_join([
                f"<## radical-{radical}-characters ##>",
                f"||||{{.wide}}",
                f"''{{.modern}}",
                f"|^",
                f"  //",
                f"    ; Residual strokes",
                f"    ; Character entry links",
                f"|:",
                [
                    [
                        f'  //',
                        f'    , {stroke_count}',
                        f'    ,',
                        f'      <nav class="sideways">',
                        f'      ==',
                        [
                            f'      - {link_sequence_braced}'
                            for character_entries in character_entries_from_character.values()
                            if (
                                link_sequence := ', '.join(
                                    character_entry.universal_link()
                                    for character_entry in character_entries
                                ),
                                link_sequence_braced := (
                                    f'{{{link_sequence}}}' if len(character_entries) > 1
                                    else link_sequence
                                ),
                            )
                        ],
                        f'      ==',
                        f'      </nav>',
                    ]
                    for stroke_count, character_entries in character_entries_from_stroke_count.items()
                    if (
                        character_entries_from_character := Utilities.collate_firsts_by_second(
                            (character_entry, character_entry.character)
                            for character_entry in character_entries
                        ),
                    )
                ],
                f"''",
                f"||||",
                f"<## /radical-{radical}-characters ##>",
            ])

        return re.sub(
            pattern=r'<## radical-(?P<radical>\S)-characters ##>.*?<## /radical-(?P=radical)-characters ##>',
            repl=replacement_function,
            string=content,
            flags=re.DOTALL,
        )


class PageHeading:
    content: str
    williams_list: list[str]
    jyutping: str

    def __init__(self, page_content: str, file_name: str, page_title: str):
        if not (match := re.search(
            pattern=r'^ \# \{\.williams\} \s+ (?P<williams_run> .*? ) \s* \[\[ (?P<jyutping> [a-z]+ ) \]\] $',
            string=page_content,
            flags=re.MULTILINE | re.VERBOSE,
        )):
            raise LintException('page heading `#{.williams} ...` not found')

        content = match.group()
        williams_run = match.group('williams_run')
        jyutping = match.group('jyutping')

        if file_name != f'entries/{jyutping}.cmd':
            raise LintException(f'inconsistent page heading Jyutping `{jyutping}` vs file name `{file_name}`')

        if page_title != jyutping:
            raise LintException(f'inconsistent page heading Jyutping `{jyutping}` vs page title `{page_title}`')

        williams_list = [
            re.sub(pattern='[.]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.williams_list = williams_list
        self.jyutping = jyutping


class PageEntry:
    content_from_key: Optional[dict[str, str]]
    wh_williams_list: Optional[str]
    wp_williams_list: Optional[str]
    mp_jyutping_list: Optional[str]
    see_also_links: Optional[list[str]]

    def __init__(self, page_content: str, page_heading_jyutping: str):
        if match := re.search(
            pattern=r'<## /tones ##>\s+^\$\$\n(?P<content>.+?)^\$\$\n',
            string=page_content,
            flags=re.DOTALL | re.MULTILINE,
        ):
            content = match.group('content')
            content_from_key = CmdIdioms.parse_entry_items(content)

            PageEntry.lint_keys(content_from_key)
            PageEntry.lint_wh_contextual_non_insertion(content_from_key['WH'])

            wh_williams_list = PageEntry.extract_williams_heading_list(content_from_key['WH'])
            wp_williams_list = PageEntry.extract_williams_heading_list(content_from_key['WP'])
            mp_jyutping_list = PageEntry.extract_jyutping_heading_list(content_from_key['MP'])
            see_also_links = PageEntry.extract_see_also_links(content_from_key.get('S'))

            PageEntry.lint_williams_heading_lists(wh_williams_list, wp_williams_list)
            PageEntry.lint_page_heading_against_mp(page_heading_jyutping, mp_jyutping_list)
            CmdIdioms.lint_see_also_link_order(see_also_links)
        else:
            content_from_key = None
            wh_williams_list = None
            wp_williams_list = None
            mp_jyutping_list = None
            see_also_links = None

        self.content_from_key = content_from_key
        self.wh_williams_list = wh_williams_list
        self.wp_williams_list = wp_williams_list
        self.mp_jyutping_list = mp_jyutping_list
        self.see_also_links = see_also_links

    @staticmethod
    def lint_keys(content_from_key: dict[str, str]):
        keys = ''.join(f'{key} ' for key in content_from_key)
        pattern_readable = 'WH [WV] WP MP [C] [S] '
        pattern = re.sub(
            pattern=r'\[ (?P<optional_key> \S+ ) \] [ ]',
            repl=r'(?:\g<optional_key> )?',
            string=pattern_readable,
            flags=re.VERBOSE,
        )

        if not re.fullmatch(pattern=pattern, string=keys):
            raise LintException(f'page entry keys `{keys}` do not match pattern `{pattern_readable}`')

    @staticmethod
    def lint_wh_contextual_non_insertion(content: str):
        if '[[...]]' in content:
            raise LintException('contextual non-insertion `[[...]]` in WH')

        if '[[Not present]]' in content:
            raise LintException(
                'contextual non-insertion `[[Not present]]` in WH '
                '(change to insertion with caret before closing square brackets)'
            )

    @staticmethod
    def lint_williams_heading_lists(wh_williams_list: list[str], wp_williams_list: list[str]):
        if wh_williams_list != wp_williams_list:
            raise LintException(
                f'inconsistent WH Williams list `{wh_williams_list}` vs WP Williams list `{wp_williams_list}`'
            )

    @staticmethod
    def lint_page_heading_against_mp(page_heading_jyutping: str, mp_jyutping_list: list[str]):
        if not mp_jyutping_list:
            raise LintException('MP contains no Jyutping items')

        if (mp_jyutping_first := mp_jyutping_list[0]) != page_heading_jyutping:
            raise LintException(
                f'first MP jyutping item `{mp_jyutping_first}` is not page heading Jyutping `{page_heading_jyutping}`'
            )

    @staticmethod
    def extract_williams_heading_list(content: str) -> list[str]:
        return [
            williams_run.replace('.', '')
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<williams_run> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                williams_run := match.group('williams_run'),
            )
        ]

    @staticmethod
    def extract_jyutping_heading_list(content: str) -> list[str]:
        return [
            jyutping
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<jyutping> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                jyutping := match.group('jyutping'),
            )
        ]

    @staticmethod
    def extract_see_also_links(content: Optional[str]) -> Optional[list[str]]:
        if content is None:
            return None

        return [
            link
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<link> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                link := match.group('link'),
            )
        ]


class ToneNavigator:
    content: Optional[str]

    def __init__(self, page_content: str):
        if match := re.search(
            pattern='<## tones ##>.*?<## /tones ##>',
            string=page_content,
            flags=re.DOTALL,
        ):
            content = match.group()
        else:
            content = None

        self.content = content


class ToneHeading:
    content: str
    tone_number: str
    williams_list: list[str]
    jyutping: str
    chinese: str

    def __init__(self, content: str, tone_number: str, williams_run: str, jyutping: str, chinese: str,
                 page_heading_jyutping: str):
        if f'{page_heading_jyutping}{tone_number}' != jyutping:
            raise LintException(
                f'inconsistent page heading Jyutping `{page_heading_jyutping}` and tone number `{tone_number}` '
                f'vs Jyutping `{jyutping}` in tone heading `{content}`'
            )

        williams_tones = set(re.findall(pattern=r'\([1-9]\)', string=williams_run))

        if len(williams_tones) != 1:
            raise LintException(f'non-sole Williams tones `{williams_tones}` found in tone heading `{content}`')

        williams_tone = williams_tones.pop()
        williams_tone_number = re.sub(pattern='[()]', repl='', string=williams_tone)
        williams_tone_index = int(williams_tone_number) - 1

        if CANTONESE_TONES_CHINESE[williams_tone_index] != chinese:
            raise LintException(f'Williams tone `{williams_tone}` is not `{chinese}` in tone heading `{content}`')

        jyutping_is_entering = jyutping[-2] in 'ptk'
        jyutping_tone_number = jyutping[-1]
        jyutping_proper_tone_number = (
            jyutping_tone_number.translate(str.maketrans('136', '789')) if jyutping_is_entering
            else jyutping_tone_number
        )
        jyutping_tone_index = int(jyutping_proper_tone_number) - 1

        if CANTONESE_TONES_CHINESE[jyutping_tone_index] != chinese:
            raise LintException(f'Jyutping `{jyutping}` is not `{chinese}` in tone heading `{content}`')

        williams_list = [
            re.sub(pattern='[.^]', repl='', string=williams)
            for williams in williams_run.split()
        ]

        self.content = content
        self.tone_number = tone_number
        self.williams_list = williams_list
        self.jyutping = jyutping
        self.chinese = chinese


class CharacterNavigator:
    content: str
    tone_number: str

    def __init__(self, content: str, tone_number: str):
        self.content = content
        self.tone_number = tone_number


class CharacterEntry:
    heading_content: str
    is_canonical: bool
    is_added: bool
    character: str
    composition: Optional[str]
    tone_number: str
    williams_list: list[str]
    jyutping: str
    content_from_key: dict[str, str]
    radical_strokes_list: list['RadicalStrokes']
    unicode_code_point: str
    h_content: Optional[str]
    f_content: str
    w_content: str
    p_content: Optional[str]
    e_content: Optional[str]
    alternative_forms: Optional[list['AlternativeForm']]
    reading_variations: Optional[list['ReadingVariation']]
    cantonese_entries: Optional[list['CantoneseEntry']]
    see_also_links: Optional[list[str]]

    def __init__(self, heading_content: str, addition: str, character_run: str, tone_number: str, williams_run: str,
                 jyutping: str, non_canonical: str, entry_content: str, page_heading_jyutping: str):
        is_canonical = not non_canonical
        is_added = bool(addition)

        reduced_character_run = re.sub(
            pattern=r'^ (?: ~~ .+? ~~ )? `` (?P<reduced_character_run> \S+ ) `` $',
            repl=r'\g<reduced_character_run>',
            string=character_run,
            flags=re.VERBOSE,
        )

        if composition_match := re.fullmatch(
            pattern=r'\{ (?P<character> \S ) = (?P<composition> \S+ ) \}',
            string=reduced_character_run,
            flags=re.VERBOSE,
        ):
            character = composition_match.group('character')
            composition = composition_match.group('composition')
        elif len(reduced_character_run) == 1:
            character = reduced_character_run
            composition = None
        else:
            raise LintException(
                f'invalid character run `{character_run}` in heading `{heading_content}`'
            )

        if f'{page_heading_jyutping}{tone_number}' != jyutping:
            raise LintException(
                f'inconsistent page heading Jyutping `{page_heading_jyutping}` and tone number `{tone_number}` '
                f'vs Jyutping `{jyutping}` in heading `{heading_content}`'
            )

        reduced_williams_run = re.sub(pattern='~~.+?~~', repl='', string=williams_run)
        williams_tones = set(re.findall(pattern=r'\([1-9]\)', string=reduced_williams_run))

        if len(williams_tones) != 1:
            raise LintException(
                f'non-sole Williams tones `{williams_tones}` found in heading `{heading_content}`'
            )

        williams_tone = williams_tones.pop()
        williams_tone_number = re.sub(pattern='[()]', repl='', string=williams_tone)

        jyutping_is_entering = jyutping[-2] in 'ptk'
        jyutping_proper_tone_number = (
            tone_number.translate(str.maketrans('136', '789')) if jyutping_is_entering
            else tone_number
        )

        if williams_tone_number != jyutping_proper_tone_number:
            raise LintException(f'inconsistent Williams tone `{williams_tone}` vs Jyutping `{jyutping}`')

        williams_list = reduced_williams_run.replace('_', '').split()

        content_from_key = CmdIdioms.parse_entry_items(entry_content)

        CharacterEntry.lint_romanisation_consistency(williams_list, jyutping, heading_content)
        CharacterEntry.lint_keys(content_from_key, heading_content)

        radical_strokes_list = CharacterEntry.extract_radical_strokes_list(content_from_key['R'])
        unicode_code_point = CharacterEntry.extract_unicode_code_point(content_from_key['U'])
        h_content = content_from_key.get('H')
        f_content = content_from_key['F']
        w_content = content_from_key['W']
        p_content = content_from_key.get('P')
        e_content = content_from_key.get('E')
        alternative_forms = CharacterEntry.extract_alternative_forms(content_from_key.get('A'), jyutping)
        reading_variations = CharacterEntry.extract_reading_variations(content_from_key.get('V'))
        cantonese_entries = CharacterEntry.extract_cantonese_entries(e_content, page_heading_jyutping)
        see_also_links = CharacterEntry.extract_see_also_links(content_from_key.get('S'))

        CharacterEntry.lint_character_against_unicode_code_point(character, unicode_code_point)
        CharacterEntry.lint_williams_locator_tone(w_content)
        CharacterEntry.lint_williams_ellipsis_item_punctuation(w_content)
        CharacterEntry.lint_williams_romanisation_punctuation(w_content)
        CharacterEntry.lint_character_jyutping_consistency(e_content)

        CharacterEntry.lint_canonicality(is_canonical, w_content, p_content, e_content, heading_content)
        CharacterEntry.lint_additionality(is_added, character_run, williams_run, character, w_content, heading_content)
        CharacterEntry.lint_fan_wan_same_romanisation(williams_run, f_content, heading_content)

        CharacterEntry.lint_cantonese_entry_order(cantonese_entries)
        CmdIdioms.lint_see_also_link_order(see_also_links)

        self.heading_content = heading_content
        self.is_canonical = is_canonical
        self.is_added = is_added
        self.character = character
        self.composition = composition
        self.tone_number = tone_number
        self.williams_list = williams_list
        self.jyutping = jyutping
        self.content_from_key = content_from_key
        self.radical_strokes_list = radical_strokes_list
        self.unicode_code_point = unicode_code_point
        self.h_content = h_content
        self.f_content = f_content
        self.w_content = w_content
        self.p_content = p_content
        self.alternative_forms = alternative_forms
        self.reading_variations = reading_variations
        self.cantonese_entries = cantonese_entries
        self.see_also_links = see_also_links

    def __lt__(self, other):
        return self.sorting_rank() < other.sorting_rank()

    def __str__(self):
        return self.heading_content

    def sorting_rank(self) -> tuple[str, str, int, bool, str]:
        return (
            self.jyutping,
            self.radical_strokes_list[0].radical,
            self.radical_strokes_list[0].stroke_count,
            not (0x4E00 <= ord(self.character) <= 0x9FFF),  # whether character is an extension ideograph
            self.character,
        )

    def composed_character(self) -> str:
        if self.composition is None:
            return self.character

        return f'{{{self.character}={self.composition}}}'

    def same_page_link(self) -> str:
        return f'${self.composed_character()}{self.tone_number}'

    def universal_link(self) -> str:
        return f'${self.composed_character()}{self.jyutping}'

    def entry_content(self) -> str:
        if not self.p_content:
            return self.w_content

        return '\n'.join([self.w_content, self.p_content])

    @staticmethod
    def lint_romanisation_consistency(williams_list: list[str], jyutping: str, heading_content: str):
        jyutping_list = [jyutping for _ in williams_list]

        if inconsistency := CmdSource.get_first_romanisation_inconsistency(williams_list, jyutping_list):
            raise LintException(
                f'inconsistent Williams `{inconsistency.williams}` '
                f'vs Jyutping `{inconsistency.jyutping}` (expected {inconsistency.expected_jyutping_list}) '
                f'under `{heading_content}`'
            )


    @staticmethod
    def lint_keys(content_from_key: dict[str, str], heading_content: str):
        keys = ''.join(f'{key} ' for key in content_from_key)
        pattern_readable = 'R U [H] [A] [V] F W [C] [P] [E] [S] '
        pattern = re.sub(
            pattern=r'\[ (?P<optional_key> \S+ ) \] [ ]',
            repl=r'(?:\g<optional_key> )?',
            string=pattern_readable,
            flags=re.VERBOSE,
        )

        if not re.fullmatch(pattern=pattern, string=keys):
            raise LintException(
                f'character entry keys `{keys}` do not match pattern `{pattern_readable}` under `{heading_content}`'
            )

    @staticmethod
    def lint_character_against_unicode_code_point(character: str, unicode_code_point: str):
        if Utilities.unicode_code_point(character) != unicode_code_point:
            raise LintException(f'character `{character}` is not `{unicode_code_point}`')

    @staticmethod
    def lint_williams_locator_tone(content: str):
        for match in re.finditer(
            pattern=r'^ [ ]+ [-][ ] \[\[ Page~\S+ [ ] (?P<headword_run> .*? ) \]\] $',
            string=content,
            flags=re.MULTILINE | re.VERBOSE,
        ):
            locator_run = match.group().strip()
            headword_run = match.group('headword_run')

            if not re.search(pattern=r'\([1-9]\)', string=headword_run):
                raise LintException(f'missing Williams tone in locator `{locator_run}`')

    @staticmethod
    def lint_williams_ellipsis_item_punctuation(content: str):
        ellipsis_item = '- [[...]]'
        ellipsis_item_pattern = re.escape(ellipsis_item)
        unpunctuated_ellipsis_item_pattern = f'^[ ]+{ellipsis_item_pattern}$'
        if re.search(pattern=unpunctuated_ellipsis_item_pattern, string=content, flags=re.MULTILINE):
            raise LintException(
                f'unpunctuated ellipsis item `{ellipsis_item}` '
                f'(suppress with caret after closing square brackets if legitimate)'
            )

    @staticmethod
    def lint_williams_romanisation_punctuation(content: str):
        if unwanted_comma_match := re.search(
            pattern=r'''
                _ \S[^_\n]*? (?: \([36789]\) | ' ) (?: ~~ \s* `` [^~\n]*? `` )? _  # Williams romanisation
                \s+
                \[\[ [^\[\n]+? \]\]  # supplied Jyutping
                (?: \s+ \[\[ .*? \]\] )?  # supplied Kangxi with punctuation
                ,  # unwanted comma
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            unwanted_comma_context = unwanted_comma_match.group()
            unwanted_comma_context_reduced = re.sub(pattern=r'\s+', repl=' ', string=unwanted_comma_context)
            raise LintException(
                f'comma after supplied Jyutping for Williams right-tone or nasal apostrophe '
                f'in `{unwanted_comma_context_reduced}` '
                f'(suppress with caret before comma if legitimate)'
            )

        if missing_comma_match := re.search(
            pattern=r'''
                _ \S[^_\n]*? \([1245]\) \S+ [^'`] (?: ~~ \s* `` [^~\n]*? `` )? _  # Williams romanisation
                \s+
                \[\[ [^,\n]+? \]\]  # supplied Jyutping
                (?! \s+ \[\[ .*? \]\] \S )  # supplied Kangxi with punctuation
                \s  # missing comma
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            missing_comma_context = missing_comma_match.group()
            missing_comma_context_reduced = re.sub(pattern=r'\s+', repl=' ', string=missing_comma_context.strip())
            raise LintException(
                f'missing comma after supplied Jyutping for Williams left-tone in `{missing_comma_context_reduced}` '
                f'(suppress with caret after closing square brackets if legitimate)'
            )

    @staticmethod
    def lint_character_jyutping_consistency(content: str):
        if content is None:
            return

        for item_match in re.finditer(
            pattern=r'''
                - [ ]+
                (?P<character_content> \S+ )
                \s+
                \( (?P<jyutping> .*? ) \)
            ''',
            string=content,
            flags=re.VERBOSE,
        ):
            item_content = item_match.group()
            character_content = item_match.group('character_content')
            jyutping = item_match.group('jyutping')

            characters, is_term = re.subn(
                pattern=r'【 (?P<term> [^\s-]+ ) \S* 】',
                repl=r'\g<term>',
                string=CmdIdioms.strip_compositions(character_content).replace('、', ''),
                flags=re.VERBOSE,
            )
            if is_term:
                jyutping_lists = [
                    split_jyutping.split()
                    for split_jyutping in jyutping.split(sep=', ')
                ]
            else:
                jyutping_lists = [jyutping.split()]

            character_count = len(characters)

            for jyutping_list in jyutping_lists:
                jyutping_count = len(jyutping_list)
                if character_count != jyutping_count:
                    raise LintException(
                        f'inconsistent character count `{character_count}` vs Jyutping count `{jyutping_count}` '
                        f'in `{item_content}`'
                    )

    @staticmethod
    def lint_canonicality(is_canonical: bool, w_content: str, p_content: Optional[str], e_content: Optional[str],
                          heading_content: str):
        stripped_w_content = CmdIdioms.strip_comments(w_content).strip()
        redirect_phrase = 'for the canonical'

        is_w_canonical = (
            stripped_w_content != '[[Not present]]' and redirect_phrase not in stripped_w_content
            or re.search(
                pattern=r'^ [ ]+ (?: [-][ ] (?! \[\[Page | ~~ .*? ~~$ ) | [A-Z_] )',
                string=stripped_w_content,
                flags=re.MULTILINE | re.VERBOSE,
            )
        )
        is_p_canonical = (
            p_content is not None
            and (definition_first_lines := re.findall(pattern='^[ ]+1[.].*', string=p_content, flags=re.MULTILINE))
            and any(redirect_phrase not in line for line in definition_first_lines)
        )
        is_e_canonical = e_content is not None

        if is_w_canonical or is_p_canonical or is_e_canonical:
            if not is_canonical:
                raise LintException(f'expected `{heading_content}` to be canonical')
        else:
            if is_canonical:
                raise LintException(f'expected `{heading_content}` to be non-canonical')

    @staticmethod
    def lint_additionality(is_added: bool, character_run: str, williams_run: str, character: str, w_content: str,
                           heading_content: str):
        redirect_verbs = ['corrected', 'normalised', 'exemplified']
        locator_lines = re.findall(
            pattern=r'^ [ ]+ [-][ ] \[\[ Page~\S+ [ ] .*? \]\] $',
            string=w_content,
            flags=re.MULTILINE | re.VERBOSE,
        )

        if w_content.strip() != '[[Not present]]' and character not in '\n'.join(locator_lines):
            raise LintException(
                f'character `{character}` not present in at least one locator under `{heading_content}`'
            )

        if any(
            same_romanisation_locator_line := line
            for line in locator_lines
            if (
                line.count('_') == 2
                and williams_run in line
                and not f'^{williams_run}' in line
            )
        ):
            raise LintException(
                f'same-romanisation locator `{same_romanisation_locator_line.strip()}` under `{heading_content}` '
                f'(suppress wth caret before opening underscore if legitimate (e.g. for disambiguation))'
            )

        are_locators_all_redirected = all(
            character not in line
            or any(v in line for v in redirect_verbs)
            or (
                line.count('_') == 2
                and all(w not in line for w in williams_run.split())
            )
            for line in locator_lines
        )
        is_heading_edited = any(
            '``' in run
            for run in [character_run, williams_run]
        )
        is_alternative_given = any(
            f'read {williams}' in w_content.lower()
            for williams in williams_run.lower().split()
        )

        if are_locators_all_redirected and not is_heading_edited:
            if not (is_added or is_alternative_given):
                raise LintException(f'expected `{heading_content}` to be added ')
        else:
            if is_added:
                raise LintException(f'expected `{heading_content}` to be non-added ')

    @staticmethod
    def lint_fan_wan_same_romanisation(williams_run: str, f_content: str, heading_content: str):
        if williams_run in f_content:
            raise LintException(f'same-romanisation Fan Wan locator under `{heading_content}`')

    @staticmethod
    def lint_cantonese_entry_order(cantonese_entries: Optional[list['CantoneseEntry']]):
        if cantonese_entries is None:
            return

        terms_readable = [
            f'{CmdIdioms.strip_compositions(cantonese_entry.term)} {cantonese_entry.jyutping_list[0]}'
            for cantonese_entry in cantonese_entries
        ]
        sorted_terms_readable = [
            f'{CmdIdioms.strip_compositions(cantonese_entry.term)} {cantonese_entry.jyutping_list[0]}'
            for cantonese_entry in sorted(cantonese_entries)
        ]
        if terms_readable != sorted_terms_readable:
            raise LintException(
                f'Cantonese entries {terms_readable} not in sorted order (expected {sorted_terms_readable})'
            )

    @staticmethod
    def extract_radical_strokes_list(content: str) -> list['RadicalStrokes']:
        return [
            RadicalStrokes(radical_strokes_run)
            for match in re.finditer(
                pattern='^ [ ]+ (?P<radical_strokes_run> .*? ) $',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                radical_strokes_run := match.group('radical_strokes_run'),
            )
        ]

    @staticmethod
    def extract_unicode_code_point(content: str) -> str:
        stripped_content = content.strip()

        if not (match := re.fullmatch(
            pattern='U[+][0-9A-F]{4,5}',
            string=stripped_content,
        )):
            raise LintException(f'invalid Unicode code point `{stripped_content}`')

        return match.group()

    @staticmethod
    def extract_alternative_forms(content: Optional[str], jyutping: str) -> Optional[list['AlternativeForm']]:
        if content is None:
            return None

        return [
            AlternativeForm(character_or_link, jyutping)
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<character_or_link> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                character_or_link := match.group('character_or_link'),
            )
        ]

    @staticmethod
    def extract_reading_variations(content: Optional[str]) -> Optional[list['ReadingVariation']]:
        if content is None:
            return None

        return [
            ReadingVariation(raw_jyutping)
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<raw_jyutping> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                raw_jyutping := match.group('raw_jyutping'),
            )
        ]

    @staticmethod
    def extract_cantonese_entries(content: Optional[str], page_heading_jyutping: str
                                  ) -> Optional[list['CantoneseEntry']]:
        if content is None:
            return None

        return [
            CantoneseEntry(term, disambiguation_suffix, jyutping_content, page_heading_jyutping)
            for match in re.finditer(
                pattern=r'''
                    ^ [ ]+ [-][ ]
                    【 (?P<term> [^\s-]+ ) (?P<disambiguation_suffix> \S* ) 】
                    [ ] \( (?P<jyutping_content> .* ) \) :
                ''',
                string=content,
                flags = re.MULTILINE | re.VERBOSE,
            )
            if (
                term := match.group('term'),
                disambiguation_suffix := match.group('disambiguation_suffix'),
                jyutping_content := match.group('jyutping_content'),
            )
        ]

    @staticmethod
    def extract_see_also_links(content: Optional[str]) -> Optional[list[str]]:
        if content is None:
            return None

        return [
            link
            for match in re.finditer(
                pattern=r'^ [ ]+ - [ ] (?P<link> \S+ )',
                flags=re.MULTILINE | re.VERBOSE,
                string=content,
            )
            if (
                link := match.group('link'),
            )
        ]

class RadicalStrokes:
    radical: str
    stroke_count: int

    def __init__(self, radical_strokes_run: str):
        if not (match := re.fullmatch(
            pattern=r'(?P<radical> \S ) [ ][+][ ] (?P<stroke_count> [0-9]+ )',
            string=radical_strokes_run,
            flags=re.VERBOSE,
        )):
            raise LintException(f'invalid radical strokes run `{radical_strokes_run}`')

        radical = match.group('radical')
        stroke_count = int(match.group('stroke_count'))

        if radical not in KANGXI_RADICALS:
            if radical in CJK_UNIFIED_IDEOGRAPH_RADICALS:
                translation_table = str.maketrans(CJK_UNIFIED_IDEOGRAPH_RADICALS, KANGXI_RADICALS)
                expected_radical = radical.translate(translation_table)
                suggestion = f' (did you mean {Utilities.unicode_code_point(expected_radical)} `{expected_radical}`?)'
            else:
                suggestion = ''

            raise LintException(f'invalid radical `{radical}`{suggestion}')

        self.radical = radical
        self.stroke_count = stroke_count

    def __eq__(self, other):
        return self.identity() == other.identity()

    def __hash__(self):
        return hash(self.identity())

    def __lt__(self, other):
        return self.identity() < other.identity()

    def __str__(self):
        return f'{self.radical} + {self.stroke_count}'

    def identity(self) -> tuple[str, int]:
        return self.radical, self.stroke_count


class AlternativeForm:
    content: str
    character: str
    jyutping: str
    linked_tone: Optional[str]

    def __init__(self, character_or_link: str, jyutping: str):
        if not (match := re.fullmatch(
            pattern=r'(?P<dollar> \$? ) (?P<character> \S ) (?P<tone> [1-6]? ) (?P<caret> \^? )',
            string=CmdIdioms.strip_compositions(character_or_link),
            flags=re.VERBOSE,
        )):
            raise LintException(f'invalid alternative form link `{character_or_link}`')

        dollar = match.group('dollar')
        character = match.group('character')
        tone = match.group('tone')
        caret = match.group('caret')

        if dollar and not tone:
            raise LintException(f'missing tone number in alternative form link `{character_or_link}`')

        if tone and not dollar:
            raise LintException(f'missing dollar sign in alternative form link `{character_or_link}`')

        if tone and not caret and jyutping[-1] != tone:
            raise LintException(
                f'wrong tone in alternative form link `{character_or_link}` '
                f'(suppress with caret after tone number if legitimate)'
            )

        self.content = character_or_link
        self.character = character
        self.jyutping = jyutping
        self.linked_tone = tone


class ReadingVariation:
    is_changed: bool
    jyutping: str
    unchanged_jyutping: Optional[str]
    effective_jyutping: str
    is_redirect_necessary: bool

    def __init__(self, raw_jyutping: str):
        if unchanged_match := re.fullmatch(
            pattern=r'(?P<jyutping> [a-z]+[1-6] ) (?P<caret> \^? )',
            string=raw_jyutping,
            flags=re.VERBOSE,
        ):
            is_changed = False
            jyutping = unchanged_match.group('jyutping')
            unchanged_jyutping = None
            effective_jyutping = jyutping
            caret = unchanged_match.group('caret')

        elif changed_match := re.fullmatch(
            pattern=r'''
                (?P<jyutping> (?P<unchanged_jyutping> [a-z]+[1-6] ) - (?P<changed_tone> [1-6] ) )
                (?P<caret> \^? )
            ''',
            string=raw_jyutping,
            flags=re.VERBOSE,
        ):
            is_changed = True
            jyutping = changed_match.group('jyutping')
            unchanged_jyutping = changed_match.group('unchanged_jyutping')
            changed_tone = changed_match.group('changed_tone')
            caret = changed_match.group('caret')

            if unchanged_jyutping[-1] == changed_tone:
                raise LintException(f'changed-tone reading variation `{jyutping}` does not change tone')

            effective_jyutping = unchanged_jyutping[:-1] + changed_tone

        else:
            raise LintException(f'invalid reading variation `{raw_jyutping}`')

        is_redirect_necessary = not caret

        self.is_changed = is_changed
        self.jyutping = jyutping
        self.unchanged_jyutping = unchanged_jyutping
        self.effective_jyutping = effective_jyutping
        self.is_redirect_necessary = is_redirect_necessary


class CantoneseEntry:
    term: str
    disambiguation_suffix: str
    jyutping_list: list[str]
    page_heading_jyutping: str

    def __init__(self, term: str, disambiguation_suffix: str, jyutping_content: str, page_heading_jyutping: str):
        jyutping_list = jyutping_content.split(sep=', ')
        jyutping_set = set(jyutping_list)

        if len(jyutping_set) < len(jyutping_list):
            raise LintException(f'duplicate Jyutping readings in `{jyutping_content}` for Cantonese term `{term}`')

        self.term = term
        self.disambiguation_suffix = disambiguation_suffix
        self.jyutping_list = jyutping_list
        self.page_heading_jyutping = page_heading_jyutping

    def __lt__(self, other):
        return self.sorting_rank() < other.sorting_rank()

    def sorting_rank(self) -> tuple[list[str], list[str], str]:
        return (
            self.jyutping_list,
            self.jyutping_list[0].split(),
            CmdIdioms.strip_compositions(self.term),
        )

    def url(self) -> str:
        url_path = f'entries/{self.page_heading_jyutping}'
        url_fragment = f'cantonese-{CmdIdioms.strip_compositions(self.term)}{self.disambiguation_suffix}'
        return f'/{url_path}#{url_fragment}'

    def split(self) -> list['CantoneseEntry']:
        return [
            CantoneseEntry(self.term, self.disambiguation_suffix, split_jyutping, self.page_heading_jyutping)
            for split_jyutping in self.jyutping_list
        ]

class Linter:
    cmd_sources: list['CmdSource']
    entry_pages: list['EntryPage']
    character_entries: list['CharacterEntry']
    cantonese_entries: list['CantoneseEntry']

    def __init__(self):
        cmd_file_names = [
            os.path.normpath(os.path.join(path, file_name)).replace('\\', '/')
            for path, _, file_names in os.walk(os.curdir)
            for file_name in file_names
            if file_name.endswith('.cmd')
        ]

        cmd_sources = [CmdSource(file_name) for file_name in sorted(cmd_file_names)]
        entry_pages = [
            entry_page
            for cmd_source in cmd_sources
            if (entry_page := cmd_source.entry_page) is not None
        ]
        character_entries = [
            character_entry
            for entry_page in entry_pages
            for character_entry in entry_page.character_entries
        ]
        cantonese_entries = [
            cantonese_entry
            for entry_page in entry_pages
            for character_entry in entry_page.character_entries
            if (cantonese_entries := character_entry.cantonese_entries) is not None
            for cantonese_entry in cantonese_entries
        ]

        try:
            Linter.lint_page_entry_see_also_reciprocation(entry_pages)
            Linter.lint_character_entry_invariants(character_entries)
            Linter.lint_character_entry_alternative_form_reciprocation(character_entries)
            Linter.lint_character_entry_reading_variation_reciprocation(character_entries)
            Linter.lint_character_entry_alternative_form_redirect_reciprocation(character_entries)
            Linter.lint_character_entry_reading_variation_redirect_reciprocation(character_entries)
            Linter.lint_character_entry_see_also_reciprocation(character_entries)
            Linter.lint_cantonese_entry_url_duplication(cantonese_entries)
        except LintException as lint_exception:
            print(f'Error: {lint_exception.message}', file=sys.stderr)
            sys.exit(1)

        self.cmd_sources = cmd_sources
        self.entry_pages = entry_pages
        self.character_entries = character_entries
        self.cantonese_entries = cantonese_entries

    def index_intrapage(self):
        for cmd_source in self.cmd_sources:
            cmd_source.index_self()

    def index_interpage(self):
        self.index_entries()  # entry pages by Jyutping
        self.index_terms()  # Cantonese terms by Jyutping
        self.index_search()  # characters and compositions
        self.index_radicals()  # characters by radical

    def print_statistics(self):
        entry_page_count = len(self.entry_pages)
        done_count = sum(entry_page.is_done for entry_page in self.entry_pages)
        wip_count = entry_page_count - done_count

        character_count = len(set(character_entry.character for character_entry in self.character_entries))
        character_entry_count = len(self.character_entries)
        entry_character_ratio = character_entry_count / character_count

        added_count = sum(character_entry.is_added for character_entry in self.character_entries)
        present_count = character_entry_count - added_count
        added_fraction = added_count / character_entry_count
        present_fraction = present_count / character_entry_count

        canonical_count = sum(character_entry.is_canonical for character_entry in self.character_entries)
        redirective_count = character_entry_count - canonical_count
        canonical_fraction = canonical_count / character_entry_count
        redirective_fraction = redirective_count / character_entry_count

        todo_count = sum(cmd_source.todo_count for cmd_source in self.cmd_sources)

        print(Utilities.nested_newline_join([
            f'Statistics:',
            f'================================================================',
            f'- {entry_page_count} entry pages',
            f'  ================================',
            f'  - {done_count}/{entry_page_count} = {done_count / entry_page_count :.1%} done',
            f'  - {wip_count}/{entry_page_count} = {wip_count / entry_page_count :.1%} work in progress',
            f'  ================================',
            f'- {character_entry_count} character entries per {character_count} characters'
            f' = {entry_character_ratio :.2f} entries per character',
            f'  ================================',
            f'  - {present_count}/{character_entry_count} = {present_fraction :.1%} of headings present in Williams',
            f'  - {added_count}/{character_entry_count} = {added_fraction :.1%} of headings added by Conway',
            f'  ================================',
            f'  ================================',
            f'  - {canonical_count}/{character_entry_count} = {canonical_fraction :.1%} of entries canonical',
            f'  - {redirective_count}/{character_entry_count} = {redirective_fraction :.1%} of entries redirective',
            f'  ================================',
            f'- {todo_count} TODO',
            f'================================================================',
        ]))

    def index_entries(self):
        entry_pages_from_incipit = Utilities.collate_firsts_by_second(
            (entry_page, entry_page.page_title[0])
            for entry_page in self.entry_pages
        )

        with open('entries/index.cmd', 'r', encoding='utf-8') as read_file:
            new_content = content = read_file.read()

        new_content = Linter._replace_incipit_navigator(new_content, entry_pages_from_incipit)
        new_content = Linter._replace_entry_links(new_content, entry_pages_from_incipit)

        if new_content == content:
            return

        with open('entries/index.cmd', 'w', encoding='utf-8') as write_file:
            write_file.write(new_content)

    def index_terms(self):
        split_cantonese_entries = sorted(
            split_cantonese_entry
            for cantonese_entry in self.cantonese_entries
            for split_cantonese_entry in cantonese_entry.split()
        )

        with open('terms/index.cmd', 'r', encoding='utf-8') as read_file:
            new_content = content = read_file.read()

        new_content = Linter._replace_terms_table(new_content, split_cantonese_entries)

        if new_content == content:
            return

        with open('terms/index.cmd', 'w', encoding='utf-8') as write_file:
            write_file.write(new_content)

    def index_search(self):
        jyutping_list_from_character = Utilities.collate_firsts_by_second(
            (character_entry.jyutping, character_entry.character)
            for character_entry in self.character_entries
        )
        character_index_json = Utilities.nice_json_string(jyutping_list_from_character, newline_after='],')

        compositions_from_character = Utilities.collate_firsts_by_second(
            (composition, character_entry.character)
            for character_entry in self.character_entries
            if (composition := character_entry.composition) is not None
        )
        composition_from_character = {
            character: compositions[0]
            for character, compositions in sorted(compositions_from_character.items())
        }
        composition_index_json = Utilities.nice_json_string(composition_from_character, newline_after=',')

        with open('search/character-index.json', 'w', encoding='utf-8') as character_index_json_file:
            character_index_json_file.write(character_index_json)

        with open('search/composition-index.json', 'w', encoding='utf-8') as composition_index_json_file:
            composition_index_json_file.write(composition_index_json)

    def index_radicals(self):
        character_entries_from_radical_strokes = Utilities.collate_firsts_by_second(
            (character_entry, radical_strokes)
            for character_entry in self.character_entries
            for radical_strokes in character_entry.radical_strokes_list
        )

        for cmd_source in self.cmd_sources:
            cmd_source.index_radicals(character_entries_from_radical_strokes)

    @staticmethod
    def _replace_incipit_navigator(content: str, entry_pages_from_incipit: dict[str, list['EntryPage']]) -> str:
        incipit_navigator_content_expected = Utilities.nested_newline_join([
            '<## incipits ##>',
            '<nav class="sideways">',
            '=={.modern}',
            [
                f'- [{incipit_upper}](#{incipit_upper})'
                for incipit in entry_pages_from_incipit
                if (
                    incipit_upper := incipit.upper(),
                )
             ],
            '==',
            '</nav>',
            '<## /incipits ##>',
        ])

        return re.sub(
            pattern='<## incipits ##>.*?<## /incipits ##>',
            repl=Utilities.literal_replacement_pattern(incipit_navigator_content_expected),
            string=content,
            flags=re.DOTALL,
        )

    @staticmethod
    def lint_page_entry_see_also_reciprocation(entry_pages: list['EntryPage']):
        entry_page_from_jyutping = {
            entry_page.page_title: entry_page
            for entry_page in entry_pages
        }

        for entry_page in entry_pages:
            jyutping = entry_page.page_title

            if (see_also_links := entry_page.page_entry.see_also_links) is None:
                continue

            for see_also_link in see_also_links:
                other_jyutping = see_also_link.replace('$', '')

                if other_jyutping == jyutping:
                    raise LintException(f'self-referential see also link `${jyutping}`')

                if (other_entry_page := entry_page_from_jyutping.get(other_jyutping)) is None:
                    continue

                if not other_entry_page.is_done:
                    continue

                other_see_also_links = other_entry_page.page_entry.see_also_links
                if other_see_also_links is None or f'${jyutping}' not in other_see_also_links:
                    raise LintException(f'missing see also link `${jyutping}` under page entry for `{other_jyutping}`')

    @staticmethod
    def lint_character_entry_invariants(character_entries: list['CharacterEntry']):
        collated_character_entries_from_character = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.character)
            for character_entry in character_entries
        )

        for character, collated_character_entries in collated_character_entries_from_character.items():
            Linter.lint_character_entry_composition_consistency(character, collated_character_entries)
            Linter.lint_character_entry_radical_strokes_consistency(character, collated_character_entries)
            Linter.lint_character_entry_han_unification_vigilance_consistency(character, collated_character_entries)

    @staticmethod
    def lint_character_entry_composition_consistency(character: str, character_entries: list['CharacterEntry']):
        collated_character_entries_from_composition = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.composition)
            for character_entry in character_entries
        )

        if len(collated_character_entries_from_composition) > 1:
            collation_readable = {
                composition: [str(character_entry) for character_entry in collated_character_entries]
                for composition, collated_character_entries in collated_character_entries_from_composition.items()
            }
            raise LintException(
                f'inconsistent composition under entries for character `{character}`: {collation_readable}'
            )

    @staticmethod
    def lint_character_entry_radical_strokes_consistency(character: str, character_entries: list['CharacterEntry']):
        collated_character_entries_from_radical_strokes_values = Utilities.collate_firsts_by_second(
            (character_entry, tuple(character_entry.radical_strokes_list))
            for character_entry in character_entries
        )

        if len(collated_character_entries_from_radical_strokes_values) > 1:
            collation_readable = {
                tuple(str(radical_strokes) for radical_strokes in radical_strokes_values):
                    [str(character_entry) for character_entry in collated_character_entries]
                for radical_strokes_values, collated_character_entries
                in collated_character_entries_from_radical_strokes_values.items()
            }
            raise LintException(
                f'inconsistent R content under entries for character `{character}`: {collation_readable}'
            )

    @staticmethod
    def lint_character_entry_han_unification_vigilance_consistency(character: str,
                                                                   character_entries: list['CharacterEntry']):
        collated_character_entries_from_h_content = Utilities.collate_firsts_by_second(
            (character_entry, character_entry.h_content)
            for character_entry in character_entries
        )

        if len(collated_character_entries_from_h_content) > 1:
            collation_readable = {
                h_content: [str(character_entry) for character_entry in collated_character_entries]
                for h_content, collated_character_entries in collated_character_entries_from_h_content.items()
            }
            raise LintException(
                f'inconsistent H content under entries for character `{character}`: {collation_readable}'
            )

    @staticmethod
    def lint_character_entry_alternative_form_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            character = character_entry.character
            jyutping = character_entry.jyutping
            universal_link = character_entry.universal_link()

            if (alternative_forms := character_entry.alternative_forms) is None:
                continue

            for alternative_form in alternative_forms:
                other_character = alternative_form.character

                if other_character == character:
                    raise LintException(
                        f'self-referential alternative form `{alternative_form.content}` under `{character_entry}`'
                    )

                if linked_tone := alternative_form.linked_tone:
                    other_jyutping = jyutping[:-1] + linked_tone

                    try:
                        other_character_entry = (
                            character_entry_from_jyutping_from_character[other_character][other_jyutping]
                        )
                    except KeyError:
                        raise LintException(
                            f'non-existent target for alternative form link `{alternative_form.content}`'
                        )

                    if not re.search(
                        pattern=fr'(?i:Alternative form).*See .*{re.escape(universal_link)}',
                        string=other_character_entry.entry_content(),
                    ):
                        raise LintException(
                            f'missing alternative form redirect to `{universal_link}` under `{other_character_entry}`'
                        )
                else:
                    try:
                        other_character_entry = (
                            character_entry_from_jyutping_from_character[other_character][jyutping]
                        )
                    except KeyError:
                        other_character_entry = None

                    if other_character_entry:
                        raise LintException(
                            f'alternative form `{alternative_form.content}` not linked under `{character_entry}`'
                        )

    @staticmethod
    def lint_character_entry_reading_variation_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            character = character_entry.character
            jyutping = character_entry.jyutping
            universal_link = character_entry.universal_link()

            if (reading_variations := character_entry.reading_variations) is None:
                continue

            unchanged_jyutping_candidates = [
                jyutping,
                *[
                    rv.jyutping
                    for rv in reading_variations
                    if not rv.is_changed
                ],
            ]

            for reading_variation in reading_variations:
                other_jyutping = reading_variation.jyutping
                other_unchanged_jyutping = reading_variation.unchanged_jyutping
                other_effective_jyutping = reading_variation.effective_jyutping

                if other_unchanged_jyutping and other_unchanged_jyutping not in unchanged_jyutping_candidates:
                    raise LintException(
                        f'changed-tone reading variation `{other_jyutping}` '
                        f'is not based on one of {unchanged_jyutping_candidates} '
                        f'under {character_entry}'
                    )

                if jyutping in [other_jyutping, other_effective_jyutping]:
                    raise LintException(
                        f'self-referential reading variation `{other_jyutping}` under {character_entry}'
                    )

                try:
                    other_character_entry = (
                        character_entry_from_jyutping_from_character[character][other_effective_jyutping]
                    )
                except KeyError:
                    continue

                if reading_variation.is_redirect_necessary and not re.search(
                    pattern=fr'(?i:Reading variation).*See .*{re.escape(universal_link)}',
                    string=other_character_entry.entry_content(),
                ):
                    raise LintException(
                        f'missing reading variation redirect to `{universal_link}` under `{other_character_entry}` '
                        f'(suppress with caret after reading variation `{other_jyutping}` under `{character_entry}` '
                        f'if reading variation is historically specific)'
                    )

    @staticmethod
    def lint_character_entry_alternative_form_redirect_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            character = character_entry.character

            for redirect_match in re.finditer(
                pattern=r'(?i:Alternative form).*See .*(?P<potential_link_content>\$.*)',
                string=character_entry.entry_content()
            ):
                potential_link_content = redirect_match.group('potential_link_content')

                if 'TODO' in potential_link_content:
                    continue

                for link_match in re.finditer(
                    pattern=r'\$ (?P<link_character_content> \S+? ) (?P<link_jyutping> [a-z]+[1-6] )',
                    string=potential_link_content,
                    flags=re.VERBOSE,
                ):
                    link = link_match.group()
                    link_character_content = link_match.group('link_character_content')
                    link_jyutping = link_match.group('link_jyutping')

                    link_character = CmdIdioms.strip_compositions(link_character_content)

                    try:
                        linked_character_entry = (
                            character_entry_from_jyutping_from_character[link_character][link_jyutping]
                        )
                    except KeyError:
                        raise LintException(
                            f'link `{link}` points to non-existent entry under `{character_entry}` '
                            f'(suppress with `TODO` if yet to be added)'
                        )

                    if character not in [
                        alternative_form.character
                        for alternative_form in (linked_character_entry.alternative_forms or [])
                    ]:
                        raise LintException(f'missing alternative form `{character}` under `{linked_character_entry}`')

    @staticmethod
    def lint_character_entry_reading_variation_redirect_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            jyutping = character_entry.jyutping

            for redirect_match in re.finditer(
                pattern=r'(?i:Reading variation).*See .*(?P<potential_link_content>\$.*)',
                string=character_entry.entry_content()
            ):
                potential_link_content = redirect_match.group('potential_link_content')

                if 'TODO' in potential_link_content:
                    continue

                for link_match in re.finditer(
                    pattern=r'\$ (?P<link_character_content> \S+? ) (?P<link_jyutping> [a-z]+[1-6] )',
                    string=potential_link_content,
                    flags=re.VERBOSE,
                ):
                    link = link_match.group()
                    link_character_content = link_match.group('link_character_content')
                    link_jyutping = link_match.group('link_jyutping')

                    link_character = CmdIdioms.strip_compositions(link_character_content)

                    try:
                        linked_character_entry = (
                            character_entry_from_jyutping_from_character[link_character][link_jyutping]
                        )
                    except KeyError:
                        raise LintException(
                            f'link `{link}` points to non-existent entry under `{character_entry}` '
                            f'(suppress with `TODO` if yet to be added)'
                        )

                    if jyutping not in [
                        reading_variation.effective_jyutping
                        for reading_variation in linked_character_entry.reading_variations
                    ]:
                        raise LintException(
                            f'missing (effective) reading variation `{jyutping}` under `{linked_character_entry}`'
                        )

    @staticmethod
    def lint_character_entry_see_also_reciprocation(character_entries: list['CharacterEntry']):
        character_entry_from_jyutping_from_character = Utilities.collate_first_by_second_by_third(
            (character_entry, character_entry.jyutping, character_entry.character)
            for character_entry in character_entries
        )

        for character_entry in character_entries:
            character = character_entry.character
            jyutping = character_entry.jyutping
            universal_link = character_entry.universal_link()

            if (see_also_links := character_entry.see_also_links) is None:
                continue

            for see_also_link in see_also_links:
                if not (other_link_match := re.fullmatch(
                    pattern=r'\$ (?P<other_character_content> \S+? ) (?P<other_jyutping> [a-z]+[1-6] )',
                    string=see_also_link,
                    flags=re.VERBOSE,
                )):
                    raise LintException(f'bad see also link `{see_also_link}` under `{character_entry}`')

                other_character_content = other_link_match.group('other_character_content')
                other_jyutping = other_link_match.group('other_jyutping')

                if other_jyutping == jyutping:
                    raise LintException(f'self-referential see also link `{universal_link}` under `{character_entry}`')

                other_character = CmdIdioms.strip_compositions(other_character_content)
                if character != other_character:
                    raise LintException(
                        f'wrong character `{other_character}` in see also link `{see_also_link}` '
                        f'under `{character_entry}`'
                    )

                try:
                    other_character_entry = character_entry_from_jyutping_from_character[character][other_jyutping]
                except KeyError:
                    continue

                other_see_also_links = other_character_entry.see_also_links
                if other_see_also_links is None or universal_link not in other_see_also_links:
                    raise LintException(f'missing see also link `{universal_link}` under `{other_character_entry}`')

    @staticmethod
    def lint_cantonese_entry_url_duplication(cantonese_entries: list['CantoneseEntry']):
        collated_cantonese_entries_from_url = Utilities.collate_firsts_by_second(
            (cantonese_entry, cantonese_entry.url())
            for cantonese_entry in cantonese_entries
        )

        for url, collated_cantonese_entries in collated_cantonese_entries_from_url.items():
            if len(collated_cantonese_entries) > 1:
                raise LintException(f'duplicated Cantonese entry URL `{url}`')

    @staticmethod
    def _replace_entry_links(content: str, entry_pages_from_incipit: dict[str, list['EntryPage']]) -> str:
        entry_links_content_expected = Utilities.nested_newline_join([
            '<## entries ##>',
            [
                [
                    '',
                    f'##{{#{incipit_upper} .modern}} {incipit_upper}',
                    '',
                    '<nav>',
                    '=={.modern}',
                    [
                        f'- {link}{parenthetical_suffix}'
                        for entry_page in entry_pages
                        if (
                            link := f'${entry_page.page_title}',
                            parenthetical_suffix := '' if entry_page.is_done else ' (work in progress)',
                        )
                    ],
                    '==',
                    '</nav>',
                    '',
                ]
                for incipit, entry_pages in entry_pages_from_incipit.items()
                if (
                    incipit_upper := incipit.upper(),
                )
            ],
            '<## /entries ##>',
        ])

        return re.sub(
            pattern='<## entries ##>.*?<## /entries ##>',
            repl=Utilities.literal_replacement_pattern(entry_links_content_expected),
            string=content,
            flags=re.DOTALL,
        )

    @staticmethod
    def _replace_terms_table(content: str, split_cantonese_entries: list['CantoneseEntry']) -> str:
        terms_table_content_expected = Utilities.nested_newline_join([
            "<## terms-table ##>",
            "||||{.wide}",
            "''{.modern}",
            "|^",
            "  //",
            "    ; Jyutping",
            "    ; Entry link",
            "|:",
            [
                [
                    f'  //',
                    f'    , {jyutping}',
                    f'    , [{link_text}{parenthetical_suffix}]({url})',
                ]
                for split_cantonese_entry in split_cantonese_entries
                if (
                    jyutping := split_cantonese_entry.jyutping_list[0],
                    link_text := split_cantonese_entry.term,
                    parenthetical_suffix := re.sub(
                        pattern='-(?P<sense>.*)',
                        repl=r'~(\g<sense>)',
                        string=split_cantonese_entry.disambiguation_suffix,
                    ),
                    url := split_cantonese_entry.url(),
                )
            ],
            "''",
            "||||",
            "<## /terms-table ##>",
        ])

        return re.sub(
            pattern='<## terms-table ##>.*?<## /terms-table ##>',
            repl=Utilities.literal_replacement_pattern(terms_table_content_expected),
            string=content,
            flags=re.DOTALL,
        )


def main():
    linter = Linter()
    linter.index_intrapage()
    linter.index_interpage()
    linter.print_statistics()


if __name__ == '__main__':
    main()
