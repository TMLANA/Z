--[[
الالعاب ل سورس الزعيم
--]]
local function games(msg,MsgText)
if msg.type ~= "pv" then
if MsgText[1] == "تفعيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if not redis:get(boss..'lock_geams'..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"• تم بالتأكيد تفعيل الالعاب    \n• بواسطه 「 "..NameUser.." 」",40,utf8.len(msg.TheRankCmd)) 
else 
redis:del(boss..'lock_geams'..msg.chat_id_) 
return sendMsg(msg.chat_id_,msg.id_,"• تم تفعيل الالعاب بنجاح   \n• بواسطه 「 "..NameUser.." 」",40,utf8.len(msg.TheRankCmd)) 
end 
end,{msg=msg})
end
if MsgText[1] == "تعطيل" and MsgText[2] == "الالعاب" or MsgText[2] == "اللعبه" or MsgText[2] == "اللعبة" then
if not msg.Admin then return "• هذا الامر يخص {الادمن,المدير,المنشئ,المطور} فقط  \n" end
GetUserID(msg.sender_user_id_,function(arg,data)
msg = arg.msg 
local NameUser   = Hyper_Link_Name(data)
if redis:get(boss..'lock_geams'..msg.chat_id_) then 
return sendMsg(msg.chat_id_,msg.id_,"• تم بالتأكيد تعطيل الالعاب    \n• بواسطه 「 "..NameUser.." 」",40,utf8.len(msg.TheRankCmd)) 
else
redis:set(boss..'lock_geams'..msg.chat_id_,true)  
return sendMsg(msg.chat_id_,msg.id_,"• تم تعطيل الالعاب بنجاح   \n• بواسطه 「 "..NameUser.." 」",40,utf8.len(msg.TheRankCmd)) 
end  
end,{msg=msg}) 
end
if MsgText[1] == "اضف رسائل" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then 
return "• هذا الامر يخص {المطور,المنشئ} فقط  \n" 
end 
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER'..msg.chat_id_,ID_USER)  
redis:setex(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*• ارسل لي عدد الرسائل الذي تريده*')
end
if MsgText[1] == "اضف نقاط" and msg.reply_to_message_id_ == 0 then       
if not msg.Creator then return "• هذا الامر يخص {المطور,المنشئ} فقط  \n" end 
local ID_USER = MsgText[2]
redis:set(boss..'SET:ID:USER:NUM'..msg.chat_id_,ID_USER)  
redis:setex(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_,500,true)  
sendMsg(msg.chat_id_,msg.id_,'*• ارسل لي عدد النقاط الذي تريده*')
end
if not redis:get(boss..'lock_geams'..msg.chat_id_) and msg.GroupActive then
if MsgText[1] == 'اسئله' or MsgText[1] == 'ختيارات' or MsgText[1] == 'بدء الاسئله' then   
redis:set(boss.."GAME:S"..msg.chat_id_,true) 
t1 = [[
ماهو اطول نهر في العالم 
1- النيل  
2- الفرات 
3- نهر الكونغو


• ارسل الجواب فقط
]]
t2 = [[
ماعدد عظام الوجه?
1- 15
2- 13
3- 14 

• ارسل الجواب فقط
]]
t3 =[[
كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون?

1- الفم 
2- الاذن
3- الثلاجه


• ارسل الجواب فقط
]]
t4 =[[
كم جزء تحتوي مسلسل وادي الذئاب?

1- 7
2- 15
3- 11


• ارسل الجواب فقط
]]
t5 =[[
كم جزء يحتوي القران الكريم?

1- 60
2- 70
3- 30 


• ارسل الجواب فقط
]]
t6 =[[
من هوه اغنى رئيس في العالم??

1- ترامب
2- اوباما
3- بوتين  


• ارسل الجواب فقط
]]

t7 =[[
من هوه مؤسس شركه ابل العالميه 

1- لاري بايج 
2- بيا غايتز
3- مارك زوكيربرج


• ارسل الجواب فقط
]]
t8 =[[
ماهي عاصمه فرنسا?

1- باريس 
2- لوين 
3- موسكو 


• ارسل الجواب فقط
]]
t9 =[[
ماعدد دول العربيه التي توجد في افريقيا 

1- 10 
2- 17
3- 9

• ارسل الجواب فقط
]]
t11 =[[
ماهو الحيوان الذي يحمل 50 فوق وزنه ?
1- الفيل
2- النمل  
3- الثور


• ارسل الجواب فقط
]]
t12 =[[
ماذا يوجد بيني وبينك؟  
1- الضل
2- الاخلاق
3- حرف الواو  


• ارسل الجواب فقط
]]
t13 =[[
ماهو الشيء النبات ينبت للانسان بلا بذر؟
1- الاضافر 
2- الاسنان
3- الشعر


• ارسل الجواب فقط
]]
t14 =[[
من هو اول الرسول الى الارض؟
1- ادم
2- نوح
3- ابراهيم 


• ارسل الجواب فقط
]]
t15 =[[
ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين؟
1- سحاب
2- بئر
3- نهر


• ارسل الجواب فقط
]]
t16 =[[
ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا؟
1- العمر
2- ساعه
3- الحذاء


• ارسل الجواب فقط
]]
t17 =[[
اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم
1- نحاس
2- الماس
3- ذهب


• ارسل الجواب فقط
]]
t18 =[[
في الليل ثلاثة لكنه في النهار واحده فما هو
1- حرف الباء
2- حرف الام 
3- حرف الراء


• ارسل الجواب فقط
]]
t19 =[[
على قدر اصل العزم تأتي?
1- العزائم 
2- المكارم
3- المبائب


• ارسل الجواب فقط
]]

t20 =[[
ماهي جمع كلمه انسه ?
1- سيدات
2- انسات 
3- قوانص


• ارسل الجواب فقط
]]
t21 =[[
اله اتسعلمت قديما في الحروب?
1- الصاروخ
2- المسدس
3- المنجنيق 


• ارسل الجواب فقط
]]
t22 =[[
تقع لبنان في قاره?
1- افريقيا 
2- اسيا  
3- امركيا الشماليه


• ارسل الجواب فقط
]]

t23 =[[
1- ماهو الحيوان الذي يلقب بملك الغابه?
1- الفيل
2- الاسد 
3- النمر


• ارسل الجواب فقط
]]
t24 =[[
كم صفرا للمليون ?
1- 4 
2- 3
3- 6

• ارسل الجواب فقط
]]
t25 =[[
ما اسم صغير الحصان?
1- مهر  
2- جرو
3- عجل


• ارسل الجواب فقط
]]
t26 =[[
ما الحيوان الذي ينام واحدى عينه مفتوحه?

1- القرش
2- الدلفين 
3- الثعلب


• ارسل الجواب فقط
]]
t27 =[[
ماهي القاره التي تلقب بالقاره العجوز?

1- امريكا الشماليه 
2- امريكا الجنوبيه
3- افريقيا 


• ارسل الجواب فقط
]]
t28 =[[
ما اسم المعدن الموجود فيي الحاله السائله 

1- النحاس 
2- الحديد
3- الزئبق  


• ارسل الجواب فقط
]]
t29 =[[
ماهي عاصمه انجلترا?
1- لندن  
2- لفرسول
3- تركيا


• ارسل الجواب فقط
]]
t30 =[[
ماهو الشئ الذي برأسه سبع فتحات

1- الهاتف
2- التلفاز
3- الانسان 


• ارسل الجواب فقط
]]
t31 =[[
ماهي عاصمه اليابان ?
1- بانكول
2- نيو دلهي
3- طوكيو 


• ارسل الجواب فقط
]]
t32 =[[
من هي زوجه الرسول الاكبر منه سنآ?

1- حفضه
2- زينب 
3- خديجه 


• ارسل الجواب فقط
]]
TAHA = {t16,t17,t18,t19,t20,t21,t22,t23,t24,t25,t26,t27,t28,t29,t30,t31,t32,t1,t2,t3,t4,t5,t6,t7,t8,t9,t11,t12,t13,t14,t15}
local SENDTEXT = TAHA[math.random(#TAHA)]
if SENDTEXT:find('النيل') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'النيل') 
elseif SENDTEXT:find('14') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'14') 
elseif SENDTEXT:find('الفم') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الفم') 
elseif SENDTEXT:find('11') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'11') 
elseif SENDTEXT:find('30') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'30') 
elseif SENDTEXT:find('بوتين') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'بوتين') 
elseif SENDTEXT:find('ستيف جوبر') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'ستيف جوبر') 
elseif SENDTEXT:find('باريس') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'باريس') 
elseif SENDTEXT:find('10') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'10') 
elseif SENDTEXT:find('النمل') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'النمل') 
elseif SENDTEXT:find('حرف الواو') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'حرف الواو') 
elseif SENDTEXT:find('الشعر') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الشعر') 
elseif SENDTEXT:find('ابراهيم') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'ابراهيم') 
elseif SENDTEXT:find('سحاب') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'سحاب') 
elseif SENDTEXT:find('الاسم') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الاسم') 
elseif SENDTEXT:find('ذهب') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'ذهب') 
elseif SENDTEXT:find('حرف الام') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'حرف الام') 
elseif SENDTEXT:find('العزائم') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'العزائم') 
elseif SENDTEXT:find('انسات') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'انسات') 
elseif SENDTEXT:find('المنجنيق') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'المنجنيق') 
elseif SENDTEXT:find('اسيا') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'اسيا') 
elseif SENDTEXT:find('الاسد') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الاسد') 
elseif SENDTEXT:find('6') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'6') 
elseif SENDTEXT:find('مهر') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مهر') 
elseif SENDTEXT:find('الدلفين') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الدلفين') 
elseif SENDTEXT:find('اوروبا') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'اوروبا') 
elseif SENDTEXT:find('الزئبق') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الزئبق') 
elseif SENDTEXT:find('لندن') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'لندن') 
elseif SENDTEXT:find('الانسان') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'الانسان') 
elseif SENDTEXT:find('طوكيو') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'طوكيو') 
elseif SENDTEXT:find('خديجه') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'خديجه') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end

if MsgText[1] == 'المختلف' then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
redis:set(boss..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂','🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙎‍♂🙍‍♂🙎‍♂🙎‍♂🙎‍♂')
name = string.gsub(name,'🧖‍♂','🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♀🧖‍♂🧖‍♀🧖‍♀🧖‍♀🧖‍♀')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
return '  اول واحد يطلع المختلف ⇠ (* '..name..' * ) ' 
end

if MsgText[1] == 'امثله' then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Amthlh:'..msg.chat_id_,name)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
return 'اكمل المثل التالي {* '..name..' *}'
end

if MsgText[1] == 'كت تويت' or MsgText[1] == 'تويت' then
katu = {" دحوو1م "," دحوو2م "," دحوو3م "," دحوو4م "," دحوو5م "," دحوو6م "," دحوو7م "," دحوو8م "," دحوو9م "," دحوو10م "," دحوو11م "," دحوو12م "," دحوو13م "," دحوو14م "," دحوو15م "," دحوو16م "," دحوو17م "," دحوو18م "," دحوو19م "," دحوو20م "," دحوو21م "," دحوو22م "," دحوو23م "," دحوو24م "," دحوو25م "," دحوو26م "," دحوو27م "," دحوو28م "," دحوو29م "," دحوو30م "," دحوو31م "," دحوو32م "," دحوو33م "," دحوو34م "," دحوو35م "," دحوو36م "," دحوو37م "," دحوو38م "," دحوو39م "," دحوو40م "," دحوو41م "," دحوو42م "," دحوو43م "," دحوو44م "," دحوو45م "," دحوو46م "," دحوو47م "," دحوو48م "," دحوو49م "," دحوو50م "," دحوو51م "," دحوو52م "," دحوو53م "," دحوو54م "," دحوو55م "," دحوو56م "," دحوو57م "," دحوو58م "," دحوو59م "," دحوو60م "," دحوو61م "," دحوو62م "," دحوو63م "," دحوو64م "," دحوو65م "," دحوو66م "," دحوو67م "," دحوو68م "," دحوو69م "," دحوو70م "," دحوو71م "," دحوو72م "," دحوو73م "," دحوو74م "," دحوو75م "," دحوو76م "," دحوو77م "," دحوو78م "," دحوو79م "," دحوو80م "," دحوو81م "," دحوو82م "," دحوو83م "," دحوو84م "," دحوو85م "," دحوو86م "," دحوو87م "," دحوو88م "," دحوو89م "," دحوو90م "," دحوو91م "," دحوو92م "," دحوو93م "," دحوو94م "," دحوو95م "," دحوو96م "," دحوو97م "," دحوو98م "," دحوو99م "," دحوو100م "," دحوو101م "," دحوو102م "," دحوو103م "," دحوو104م "," دحوو105م "," دحوو106م "," دحوو107م "," دحوو108م "," دحوو109م "," دحوو110م "," دحوو111م "," دحوو112م "," دحوو113م "," دحوو114م "," دحوو115م "," دحوو116م "," دحوو117م "," دحوو118م "," دحوو119م "," دحوو120م "," دحوو121م "," دحوو121م "," دحوو122م "}
name = katu[math.random(#katu)]
redis:set(boss..':Set_twet:'..msg.chat_id_,name)
name = string.gsub(name," دحوو1م "," نسبة رضاك عن الأشخاص من حولك هالفترة ؟ ")
name = string.gsub(name," دحوو2م "," ما السيء في هذه الحياة ؟ ")
name = string.gsub(name," دحوو3م ","الفلوس او الحب ؟")
name = string.gsub(name," دحوو4م "," أجمل شيء حصل معك خلال هذا الاسبوع ؟ ")
name = string.gsub(name," دحوو5م "," سؤال ينرفزك ؟ ")
name = string.gsub(name," دحوو6م "," كم في حسابك البنكي ؟ ")
name = string.gsub(name," دحوو7م ","اكثر ممثل تحبه ؟ ")
name = string.gsub(name," دحوو8م "," قد تخيلت شي في بالك وصار ؟ ")
name = string.gsub(name," دحوو9م "," كلمة لشخص أسعدك رغم حزنك في يومٍ من الأيام ؟ ")
name = string.gsub(name," دحوو10م "," شيء عندك اهم من الناس ؟ ")
name = string.gsub(name," دحوو11م "," اول ولد لك وش راح تسميه ؟ ")
name = string.gsub(name," دحوو12م "," تفضّل النقاش الطويل او تحب الاختصار ؟ ")
name = string.gsub(name," دحوو13م "," وش أخر شي ضيعته؟ ")
name = string.gsub(name," دحوو14م "," عادي تتزوج من برا القبيلة؟ ")
name = string.gsub(name," دحوو15م "," كم مره حبيت؟ ")
name = string.gsub(name," دحوو16م ","تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟")
name = string.gsub(name," دحوو17م ","لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟")
name = string.gsub(name," دحوو18م ","قلبي على قلبك مهما صار لمين تقولها؟")
name = string.gsub(name," دحوو19م ","اكثر المتابعين عندك باي برنامج؟")
name = string.gsub(name," دحوو20م ","نسبة النعاس عندك حاليًا؟")
name = string.gsub(name," دحوو21م ","نسبه الندم عندك للي وثقت فيهم ؟")
name = string.gsub(name," دحوو22م ","وش اسم اول شخص تعرفت عليه فالتلقرام ؟")
name = string.gsub(name," دحوو23م ","جربت شعور احد يحبك بس انت مو قادر تحبه؟")
name = string.gsub(name," دحوو24م ","تجامل الناس ولا اللي بقلبك على لسانك؟")
name = string.gsub(name," دحوو25م ","عمرك ضحيت باشياء لاجل شخص م يسوى ؟")
name = string.gsub(name," دحوو26م "," مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ")
name = string.gsub(name," دحوو27م ","آخر غلطات عمرك؟ ")
name = string.gsub(name," دحوو28م ","مسلسل كرتوني له ذكريات جميلة عندك؟ ")
name = string.gsub(name," دحوو29م ","ما أكثر تطبيق تقضي وقتك عليه؟ ")
name = string.gsub(name," دحوو30م ","أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ")
name = string.gsub(name," دحوو31م ","قدوتك من الأجيال السابقة؟ ")
name = string.gsub(name," دحوو32م ","أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ")
name = string.gsub(name," دحوو33م "," أكثر حيوان تخاف منه؟ ")
name = string.gsub(name," دحوو34م ","ما هي طريقتك في الحصول على الراحة النفسية؟ ")
name = string.gsub(name," دحوو35م ","إيموجي يعبّر عن مزاجك الحالي؟ ")
name = string.gsub(name," دحوو36م ","أكثر تغيير ترغب أن تغيّره في نفسك؟ ")
name = string.gsub(name," دحوو37م "," أكثر شيء أسعدك اليوم؟ ")
name = string.gsub(name," دحوو38م "," بماذا يتعافى المرء؟ ")
name = string.gsub(name," دحوو39م "," ما هو أفضل حافز للشخص؟ ")
name = string.gsub(name," دحوو40م "," ما الذي يشغل بالك في الفترة الحالية؟")
name = string.gsub(name," دحوو41م "," آخر شيء ندمت عليه؟ ")
name = string.gsub(name," دحوو42م "," شاركنا صورة احترافية من تصويرك؟ ")
name = string.gsub(name," دحوو43م "," تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ")
name = string.gsub(name," دحوو44م "," يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ")
name = string.gsub(name," دحوو45م "," نصيحه تبدا ب -لا- ؟ ")
name = string.gsub(name," دحوو46م "," كتاب أو رواية تقرأها هذه الأيام؟ ")
name = string.gsub(name," دحوو47م "," فيلم عالق في ذهنك لا تنساه مِن روعته؟ ")
name = string.gsub(name," دحوو48م "," يوم لا يمكنك نسيانه؟ ")
name = string.gsub(name," دحوو49م "," شعورك الحالي في جملة؟ ")
name = string.gsub(name," دحوو50م "," أكثر سبب منطقي يمكن أن يجعلك تقرر الإبتعاد عن الشخص الذي تُحب؟ ")
name = string.gsub(name," دحوو51م "," كلمة لشخص بعيد؟ ")
name = string.gsub(name," دحوو52م "," صفة يطلقها عليك الشخص المفضّل؟ ")
name = string.gsub(name," دحوو53م "," أغنية عالقة في ذهنك هاليومين؟ ")
name = string.gsub(name," دحوو54م "," أكلة مستحيل أن تأكلها؟ ")
name = string.gsub(name," دحوو55م "," كيف قضيت نهارك؟ ")
name = string.gsub(name," دحوو56م "," تصرُّف ماتتحمله؟ ")
name = string.gsub(name," دحوو57م "," صفة يطلقها عليك من حولك بكثرة؟ ")
name = string.gsub(name," دحوو58م "," اسوء صفه فيك وتجاهد على تغييرها؟ ")
name = string.gsub(name," دحوو59م "," شاركنا أقوى بيت شِعر من تأليفك؟ ")
name = string.gsub(name," دحوو60م "," ماذا لو عاد معتذراً؟ ")
name = string.gsub(name," دحوو61م "," تقطع علاقتك بالشخص إذا عرفت إنه...؟ ")
name = string.gsub(name," دحوو62م "," كلام ودك يوصل للشخص المطلوب ؟ ")
name = string.gsub(name," دحوو63م "," ردة فعلك لمن يتجاهلك بالرد متعمد؟ ")
name = string.gsub(name," دحوو64م "," كم نسبة البيتوتية في شخصيتك؟ ")
name = string.gsub(name," دحوو65م "," متى تحس أنك فعلًا أنسان صبور جدًا ؟ ")
name = string.gsub(name," دحوو66م "," هل أنت من النوع الذي يواجه المشاكل أو من النوع الذي يهرب ؟ ")
name = string.gsub(name," دحوو67م "," أمنية كنت تتمناها وحققتها ؟ ")
name = string.gsub(name," دحوو68م "," تملك وسواس من شيء معين ؟ ")
name = string.gsub(name," دحوو69م "," عمرك انتقمت من أحد ؟! ")
name = string.gsub(name," دحوو70م "," متى تقرر تنسحب من أي علاقة ؟ ")
name = string.gsub(name," دحوو71م "," كلمتين تكررها دايم ؟! ")
name = string.gsub(name," دحوو72م "," افضل هديه ممكن تناسبك؟ ")
name = string.gsub(name," دحوو73م "," انت حزين اول شخص تتصل عليه؟ ")
name = string.gsub(name," دحوو74م "," موقف خلاك تحس انك مكسور ؟ ")
name = string.gsub(name," دحوو75م "," ماذا لو كانت مشاعر البشر مرئية ؟ ")
name = string.gsub(name," دحوو76م "," كم تشوف انك تستحق فرصه؟ ")
name = string.gsub(name," دحوو77م "," يهمك ظن الناس فيك ولا ؟ ")
name = string.gsub(name," دحوو78م "," اغنية عندك معاها ذكريات ")
name = string.gsub(name," دحوو79م "," موقف غير حياتك؟ ")
name = string.gsub(name," دحوو80م "," اكثر مشروب تحبه؟ ")
name = string.gsub(name," دحوو81م "," القصيدة اللي تأثر فيك؟ ")
name = string.gsub(name," دحوو82م "," متى يصبح الصديق غريب ")
name = string.gsub(name," دحوو83م "," هل وصلك رسالة غير متوقعة من شخص وأثرت فيك ؟ ")
name = string.gsub(name," دحوو84م "," وين نلقى السعاده برايك؟ ")
name = string.gsub(name," دحوو85م "," تاريخ ميلادك؟ ")
name = string.gsub(name," دحوو86م "," قهوه و لا شاي؟ ")
name = string.gsub(name," دحوو87م "," من محبّين الليل أو الصبح؟ ")
name = string.gsub(name," دحوو88م "," حيوانك المفضل؟ ")
name = string.gsub(name," دحوو89م "," كلمة غريبة ومعناها؟ ")
name = string.gsub(name," دحوو90م "," هل التعود على شخص والتحدث معه بشكل يومي يعتبر نوع من أنواع الحب؟ ")
name = string.gsub(name," دحوو91م "," كم تحتاج من وقت لتثق بشخص؟ ")
name = string.gsub(name," دحوو92م "," اشياء نفسك تجربها؟ ")
name = string.gsub(name," دحوو93م "," يومك ضاع على؟ ")
name = string.gsub(name," دحوو94م "," كل شيء يهون الا ؟ ")
name = string.gsub(name," دحوو95م "," اسم ماتحبه ؟ ")
name = string.gsub(name," دحوو96م "," وقفة إحترام للي إخترع ؟ ")
name = string.gsub(name," دحوو97م "," أقدم شيء محتفظ فيه من صغرك؟ ")
name = string.gsub(name," دحوو98م "," كلمات ماتستغني عنها بسوالفك؟ ")
name = string.gsub(name," دحوو99م "," وش الحب بنظرك؟ ")
name = string.gsub(name," دحوو100م "," حب التملك في شخصِيـتك ولا ؟ ")
name = string.gsub(name," دحوو101م "," تخطط للمستقبل ولا ؟ ")
name = string.gsub(name," دحوو102م "," موقف محرج ماتنساه ؟ ")
name = string.gsub(name," دحوو103م "," من طلاسم لهجتكم ؟ ")
name = string.gsub(name," دحوو104م "," اعترف باي حاجه ؟ ")
name = string.gsub(name," دحوو105م "," عبّر عن مودك بصوره ؟ ")
name = string.gsub(name," دحوو106م "," اسم دايم ع بالك ؟ ")
name = string.gsub(name," دحوو107م "," اشياء تفتخر انك م سويتها ؟ ")
name = string.gsub(name," دحوو108م ","  لو بكيفي كان ؟ ")
name = string.gsub(name," دحوو109م "," تحب تحتفظ بالذكريات ؟ ")
name = string.gsub(name," دحوو110م "," اغلب وقتك ضايع في؟ ")
name = string.gsub(name," دحوو111م "," اكثر كلمة تنقال لك بالبيت ؟ ")
name = string.gsub(name," دحوو112م "," كلمتك التسليكيه ؟ ")
name = string.gsub(name," دحوو113م "," تزعلك الدنيا ويرضيك ؟ ")
name = string.gsub(name," دحوو114م "," عندك فوبيا او خوف شديد من شيء معين ؟ ")
name = string.gsub(name," دحوو115م ","  غزل بلهجتك ؟ ")
name = string.gsub(name," دحوو116م "," ردة فعلك لما تنظلم من شخص ؟ ")
name = string.gsub(name," دحوو117م "," شيء تعترف انك فاشل فيه ؟ ")
name = string.gsub(name," دحوو118م "," اكثر كلمة ترفع ضغطك ؟ ")
name = string.gsub(name," دحوو119م "," نسبة جمال صوتك ؟ ")
name = string.gsub(name," دحوو120م "," كيف تتعامل مع الشخص المُتطفل ( الفضولي ) ؟ ")
name = string.gsub(name," دحوو121م "," من الاشياء اللي تجيب لك الصداع ؟ ")
name = string.gsub(name," دحوو122م "," حصلت الشخص اللي يفهمك ولا باقي ؟ ")

return '* '..name..'  *' 
end

--- لو خيروك ---

if MsgText[1] == 'لو خيروك' or MsgText[1] == 'لوخيروك' then
katu = {" دحوو1م "," دحوو2م "," دحوو3م "," دحوو4م "," دحوو5م "," دحوو6م "," دحوو7م "," دحوو8م "," دحوو9م "," دحوو10م "," دحوو11م "," دحوو12م "," دحوو13م "," دحوو14م "," دحوو15م "," دحوو16م "," دحوو17م "," دحوو18م "," دحوو19م "," دحوو20م "," دحوو21م "," دحوو22م "," دحوو23م "," دحوو24م "," دحوو25م "," دحوو26م "," دحوو27م "," دحوو28م "," دحوو29م "," دحوو30م "," دحوو31م "," دحوو32م "," دحوو33م "," دحوو34م "," دحوو35م "," دحوو36م "," دحوو37م "," دحوو38م "," دحوو39م "," دحوو40م "}
name = katu[math.random(#katu)]
redis:set(boss..':Set_khyrok:'..msg.chat_id_,name)
name = string.gsub(name," دحوو1م "," لو خيروك بين فقدان ذاكرتك والعيش مع أصدقائك وأقربائك أو بقاء ذاكرتك ولكن العيش وحيد ")
name = string.gsub(name," دحوو2م "," لو خيروك بين تناول الخضار والفاكهة طوال حياتك أو تناول اللحوم ")
name = string.gsub(name," دحوو3م "," لو خيروك بين رؤية الأشباح فقط أو سماع صوتها فقط ")
name = string.gsub(name," دحوو4م "," لو خيروك بين القدرة على سماع أفكار الناس أو القدرة على العودة في الزمن للخلف ")
name = string.gsub(name," دحوو5م "," لو خيروك بين القدرة على الاختفاء أو القدرة على الطيران ")
name = string.gsub(name," دحوو6م "," لو خيروك بين أن تعيش 5 دقائق في الماضي أو أن تعيشها في المستقبل ")
name = string.gsub(name," دحوو7م "," لو خيروك بين الاعتذار عن خطأ اقترفته أو أن يقدم لك شخص أخطأ في حقق اعتذار ")
name = string.gsub(name," دحوو8م "," لو خيروك بين الحقد أو المسامحة ")
name = string.gsub(name," دحوو9م "," لو خيروك بين إنقاذ نفسك أو إنقاذ شخص وقد يعرضك ذلك للأذى ")
name = string.gsub(name," دحوو10م "," لو خيروك بين أن تعيش في القرن الرابع عشر أو القرن الحالي ")
name = string.gsub(name," دحوو11م "," لو خيروك بين امتلاك سرعة الفهد أو دهاء الثعلب ")
name = string.gsub(name," دحوو12م "," لو خيروك بين أن تحصل على درجة كاملة في كامل اختباراتك القادمة والسابقة أو أن تسافر إلى بلد تحبه ")
name = string.gsub(name," دحوو13م "," لو خيروك بين العيش بجانب الجبال والحدائق والأشجار أو العيش بجانب البحر ")
name = string.gsub(name," دحوو14م "," لو خيروك بين تحقيق 3 أمنيات (لا تتعلق بأشخاص) أو اختيار 3 أشخاص للعيش معهم طوال حياتك ")
name = string.gsub(name," دحوو15م "," لو خيروك بين النوم في غابة مظلمة أو على ظهر سفينة في يوم عاصف ")
name = string.gsub(name," دحوو16م "," لو خيروك بين المال أو الجمال ")
name = string.gsub(name," دحوو17م "," لو خيروك بين المال أو الصحة ")
name = string.gsub(name," دحوو18م "," لو خيروك بين المال أو الذكاء ")
name = string.gsub(name," دحوو19م "," لو خيروك بين الذكاء أو الصحة ")
name = string.gsub(name," دحوو20م "," لو خيروك بين إرسال رسالة صوتية لأمك مدة دقيقة كاملة لا تحتوي إلا على صراخك وخوفك، أو كسر بيضة نيئة على رأسك ")
name = string.gsub(name," دحوو21م "," لو خيروك بين التقاط صورة لأول سيدة كبيرة تلتقي بها ونشرها على مواقع تواصل الاجتماعي مع تعليق (هذه أمي الحقيقية ومن أعيش معهم قاموا بخطفي عندما كنت صغير) أو تناول 2 كوب من خل التفاح ")
name = string.gsub(name," دحوو22م "," لو خيروك بين ارتداء ملابس الغوص ليوم كامل والذهاب إلى العمل أو ارتداء ملابس جدك/جدتك ")
name = string.gsub(name," دحوو23م "," لو خيروك بين أن تقوم بمشاركة 3 منشورات و3 صور في مواقع التواصل الاجتماعي قامت والدتك بنشرها في حسابها الشخصي، أو نشر 3 صور لك عندما كنت في المدرسة الإعدادية ")
name = string.gsub(name," دحوو24م "," لو خيروك بين قص شعرك بشكل قصير جدًا أو صبغه باللون الوردي ")
name = string.gsub(name," دحوو25م "," لو خيروك بين ضرب أول شخص تلتقي به صفعة على وجهه مهما من كان، أو الوقوف في أثناء اجتماع هام عائلي أو في العمل والصراخ قائلًا: (توقفوا … أعيدوني إلى أهلي في الفضاء الخارجي) ")
name = string.gsub(name," دحوو26م "," لو خيروك بين أن تضع الكثير من الملح على كل الطعام بدون علم أحد، أو أن تقوم بتناول شطيرة معجون أسنان ")
name = string.gsub(name," دحوو27م "," لو خيروك بين قول الحقيقة والصراحة الكاملة مدة 24 ساعة أو الكذب بشكل كامل مدة 3 أيام ")
name = string.gsub(name," دحوو28م "," لو خيروك بين أن تتناول ملعقة كبيرة تحتوي على كمية من (الخردل – المايونيز – الصلصة الحارة) أو تناول 10 ملاعق تحتوي فقط على الكاتشب ")
name = string.gsub(name," دحوو29م "," لو خيروك بين تناول الشوكولا التي تفضلها لكن مع إضافة رشة من الملح والقليل من عصير الليمون إليها أو تناول ليمونة كاملة كبيرة الحجم ")
name = string.gsub(name," دحوو30م "," لو خيروك بين وضع أحمر الشفاه على وجهك ما عدا شفتين أو وضع ماسكارا على شفتين فقط ")
name = string.gsub(name," دحوو31م "," لو خيروك بين الرقص على سطح منزلك أو الغناء على نافذتك ")
name = string.gsub(name," دحوو32م "," لو خيروك بين تناول مياه غازية مجمدة وبين تناولها ساخنة ")
name = string.gsub(name," دحوو33م "," لو خيروك بين تنظيف شعرك بسائل غسيل الأطباق وبين استخدام كريم الأساس لغسيل الأطباق ")
name = string.gsub(name," دحوو34م "," لو خيرك بين اللعب مع الأطفال لمدة 7 ساعات أو الجلوس دون فعل أي شيء لمدة 24 ساعة ")
name = string.gsub(name," دحوو35م "," لو خيروك بين شرب كوب من الحليب أو شرب كوب من شراب عرق السوس ")
name = string.gsub(name," دحوو36م "," لو خيروك بين الشخص الذي تحبه وصديق الطفولة ")
name = string.gsub(name," دحوو37م "," لو خيروك بين لاعب كرة قدم مشهور أو موسيقي مفضل بالنسبة لك ")
name = string.gsub(name," دحوو38م "," لو خيروك بين مصور فوتوغرافي جيد وبين مصور سيء ولكنه عبقري فوتوشوب ")
name = string.gsub(name," دحوو39م "," لو خيروك بين سائق سيارة يقودها ببطء وبين سائق يقودها بسرعة كبيرة ")
name = string.gsub(name," دحوو40م "," لو خيروك بين أستاذ اللغة العربية أو أستاذ الرياضيات ")

return '* '..name..'  *' 
end

--- انتهاء لو خيروك ---

if MsgText[1] == 'حزوره' then
katu = {'امي','انا','المخده','الهواء','الهواء','القمر','الباب المفتوح','النهر','الكف','الغيم','اسمك','حرف الام','الابجديه','الدائره','الساعه','تموز','الصمت','السلحفات','كم الساعه','شجره العائله','ضفدع','خليه النحل','الصوت','الجوع','الكتاب','البيض','الاسفنجه','البرتقال','الكفن','الساعه','ارجل المنضده','البصل','الوقت','النار','الثلج','العمر','المسمار','الحفره','المشط','التلفون','الجرص','المراه','الغداء','الفيل','الصدئ','الهواء','عقرب الساعه'};
name = katu[math.random(#katu)]
redis:set(boss..':Set_Hzorh:'..msg.chat_id_,name)
name = string.gsub(name,'امي','اخت خالك ومو خالتك منو')
name = string.gsub(name,'انا','بنت امك وابنت ابوك ومش اختك ولاخوك منو')
name = string.gsub(name,'المخده','اني خفيفه واني لطيفه اكوم من حضن الوزير اكعد بحضن الخليفه أزيح الهموم  واخلي لحبيب نايم منو انني')
name = string.gsub(name,'الهواء','ماهو الشيء الذي يسير امامك ولا تراه')
name = string.gsub(name,'القمر','ماهو الشيء الذي يحيا اول الشهر ويموت في اخره')
name = string.gsub(name,'الباب المفتوح','ماهو الباب الذي لا يمكن فتحه')
name = string.gsub(name,'النهر','ماهو الشي الذي يجري ولا يمشي')
name = string.gsub(name,'الكف','ماهو الشي الذي لو خمس اصابع دون لحم او عضم')
name = string.gsub(name,'الغيم','ماهو الشي الذي يمشي بلا رجلين ويبكي بلا عينين')
name = string.gsub(name,'اسمك','ماهو الشيء الذي لك ويستخدمه الناس من دون اذنك')
name = string.gsub(name,'حرف الام','ماهو الشيء الذي تراه في الليل ثلاث مرات والنهار مره واحده')
name = string.gsub(name,'الابجديه','كلمه تتكون من 8 احرف لكنها تجمع كل الحروف')
name = string.gsub(name,'الدائره','ماهو الشيء الذي ليس له بدايه وليس له نهايه')
name = string.gsub(name,'الساعه','ماهو الشيء الذي لا يتكلم واذا اكل صدق واذا جاع كذب')
name = string.gsub(name,'تموز','ماهو اسم الشهر الميلادي الذي اذا حذفت اوله تحول الى فاكهه')
name = string.gsub(name,'الصمت','ماهي الكلمه الذي يبطل معناها اذا نطقت بها ')
name = string.gsub(name,'السلحفات','ماهو الذي لحمهه من الداخل وعضمهه من الخارج ')
name = string.gsub(name,'كم الساعه','ماهوه السوال الذي تختلف اجابته دائماً')
name = string.gsub(name,'شجره العائله','ما اسم الشجره التي ليس لها ضل ولا لها ثمار ')
name = string.gsub(name,'الضفدع','ماهو الحيوان الذي لسانه طويل وجسمه صغير')
name = string.gsub(name,'خليه النحل','ماهو الشيء الذي يتسع مئاات الالوف ولا يتسع طير منتوف')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا ب الاذنين؟؟')
name = string.gsub(name,'الجوع','ماهو الشيء الذي يقرصك ولا تراه')
name = string.gsub(name,'الكتاب','له اوراق وماهو بنبات . له جلد وماهو بحيوان . وعلم وماهو ب انسان من هو')
name = string.gsub(name,'البيض','ماهو الشي الذي اسمه علئ لونه')
name = string.gsub(name,'الاسفنجه','كلي ثقوب ومع ذالك احفظ الماء فمن انا ')
name = string.gsub(name,'البرتقال','ماهو الشيء نرميه بعد العصر')
name = string.gsub(name,'الكفن','ماهو الشيء لاتحب ان تلبسة وان لبستة لاترة')
name = string.gsub(name,'الساعه','ماهو الشيء الذي يمشي ويقف وليس له ارجل')
name = string.gsub(name,'ارجل المنضده','اننا اربعة اخوه ولنا راس واحد فمن نحن')
name = string.gsub(name,'البصل','شيء تذبحه وتبكي عليه؟')
name = string.gsub(name,'الوقت','يذهب ولا يرجع')
name = string.gsub(name,'النار','شيء ياكل ولايشبع وان شرب الماء مات')
name = string.gsub(name,'الثلج','شيء مصنوع من الماء. وان عاش في الماء يموت')
name = string.gsub(name,'العمر','ماهو الشيء الذي كلما زاد نقص')
name = string.gsub(name,'المسمار','ماهو الشيء الذي لا يمشي الا ب الضرب')
name = string.gsub(name,'الحفره','ماهو الشيء الذي كلما اخذنا منهه زاد وكبر')
name = string.gsub(name,'المشط','له اسنان ولا يعض ماهو ')
name = string.gsub(name,'التلفون','يسمع بلا اذن ويحكي بلا لسان فما هو')
name = string.gsub(name,'الجرص','ماهو الشيء الذي اذا لمستهه صاح')
name = string.gsub(name,'المراه','ارى كل شيء من دون عيون فمن اكون')
name = string.gsub(name,'الغداء','ماهو الشيء الذي لايؤكل في الليل ')
name = string.gsub(name,'الفيل','من هوه الحيوان الذي يحك اذنه في انفه')
name = string.gsub(name,'الصدئ','ماهو الشيء الذي يتكلم جميع اللغات ')
name = string.gsub(name,'الهواء','شيء بيني وبينك لا تراه عينك ولا عيني فما هوه')
name = string.gsub(name,'عقرب الساعه','هناك عقرب لا يلدغ ولا يخاف منه الاطفال فما هوه')
return '  اول واحد يحلها ⇠ (* '..name..' *) ' 
end


if MsgText[1] == 'محيبس' or MsgText[1] == 'بات' then   
Num = math.random(1,6)
redis:set(boss.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊🏻 ‹› 👊🏻 ‹› 👊🏻 ‹› 👊🏻 ‹› 👊🏻 ‹› 👊🏻


• اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
• الفائز يحصل على ( 3 ) من النقاط *
]]
sendMsg(msg.chat_id_,msg.id_,TEST)   
redis:setex(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if MsgText[1] == 'خمن' or MsgText[1] == 'تخمين' then   
Num = math.random(1,20)
redis:set(boss.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n• اهلا بك عزيزي في لعبة التخمين :\nٴ· · • • • ⍒ • • • · ·\n'..'- ملاحظه لديك ( 3 ) محاولات فقط فكر قبل ارسال تخمينك \n\n'..'- سيتم تخمين عدد ما بين ال ( 1 و 20 ) اذا تعتقد انك تستطيع الفوز جرب واللعب الان *'
sendMsg(msg.chat_id_,msg.id_,TEST)
redis:setex(boss.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
if (MsgText[1] == 'اسرع' or MsgText[1] == 'الاسرع') then
local NUM = math.random(10,1000)
redis:set(boss..':NUM_SET:'..msg.chat_id_,(NUM * 3))
local Smiles = {'🍏','🍎','🍐',NUM,NUM,NUM,NUM,NUM,'🍊','🍋','🍌','🍉',NUM,NUM,NUM,NUM,NUM,'🍇','🍓','🍈','🍒',NUM,NUM,NUM,NUM,NUM,'🍑','🍍','🥥','🥝','🍅',NUM,NUM,NUM,NUM,NUM,'🍆','🥑','🥦','🥒',NUM,NUM,NUM,NUM,NUM,'🌶','🌽','🥕','🥔','🍠','🥐','🍞',NUM,NUM,NUM,NUM,NUM,'🥖','🥨','🧀','🥚','🍳','🥞','🥓',NUM,NUM,NUM,NUM,NUM,'🥩','🍗','🍖','🌭','🍔','🍟',NUM,NUM,NUM,NUM,NUM,'🍕','🥪','🥙','🍼','☕️','🍵',NUM,NUM,NUM,NUM,NUM,'🥤','🍶','🍺','🍻',NUM,NUM,NUM,NUM,NUM,'🏀','⚽️','🏈','⚾️','🎾','🏐',NUM,NUM,NUM,NUM,NUM,'🏉','🎱','🏓','🏸','🥅','🎰','🎮',NUM,NUM,NUM,NUM,NUM,'🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹',NUM,NUM,NUM,NUM,NUM,'🎼','🎧','🎤','🎬','🎨','🎭',NUM,NUM,NUM,NUM,NUM,'🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌',NUM,NUM,NUM,NUM,NUM,'🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌',NUM,NUM,NUM,NUM,NUM,'📍','📓','📗','📂','📅','📪','📫','📬',NUM,NUM,NUM,NUM,NUM,'📭','⏰','📺','🎚','☎️',NUM,NUM,NUM,NUM,NUM,'📡'}
Emoji = Smiles[math.random(#Smiles)]
redis:set(boss..':Set_Smile:'..msg.chat_id_,Emoji)
if tonumber(redis:get(boss..':Set_Smile:'..msg.chat_id_)) == tonumber(redis:get(boss..':NUM_SET:'..msg.chat_id_)) then
return '• اول من يكتب هذه العدد يفوز ⇠ `'..(redis:get(boss..':Set_Smile:'..msg.chat_id_))..'`'
else
return '️• اول من يكتب هذه السمايل يفوز ⇠ `'..(redis:get(boss..':Set_Smile:'..msg.chat_id_))..'`'
end
end

if MsgText[1] == 'ترتيب' then
if not Arry_Word or not redis:get(boss..":GetInfoNow:") then
local Trteb_Word , res = https.request('https://api.th3boss.com/Words.json')
if res ~= 200 then return "! لا يوجد اتصال بالسيرفر للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
success, Arry_Word = pcall(JSON.decode,Trteb_Word)
if not success then return "! هناك مشكله في الجيسون للاسف راسل مطور السورس ليتمكن من حل المشكله في اسرع وقت ممكن !" end
redis:setex(boss..":GetInfoNow:",7200,true)
end
local Text , UnText = next(Arry_Word.AllWords[math.random(#Arry_Word.AllWords)])
print(Text)
redis:set(boss..':Set_Arg:'..msg.chat_id_,Text)
return 'اســرع واحد يرتب ⇠ {* '..UnText..' *} «' 
end

if MsgText[1] == 'معاني' then
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديج','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
redis:set(boss..':Set_Name_Meant:'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
return '• اول من يكتب معنى السمايل يفوز ( '..name..' ) '
end
if MsgText[1] == 'عكس' or MsgText[1] == 'العكس' or MsgText[1] == 'العكسس' then   
redis:set(boss.."GAME:S"..msg.chat_id_,true) 
H1 = [[
• عكس كلمه ⇠ ( مافهمت )
]]
H2 = [[
• عكس كلمه ⇠ ( جبان )
]]
H3 =[[
• عكس كلمه ⇠ ( ميت )
]]
H4 =[[
• عكس كلمه ⇠ ( كسول )
]]
H5 =[[
• عكس كلمه ⇠ ( زين )
]]
H6 =[[
• عكس كلمه ⇠ ( عطشان )
]]

H7 =[[
• عكس كلمه ⇠ ( بارده )
]]
H8 =[[
• عكس كلمه ⇠ ( خايف )
]]
H9 =[[
• عكس كلمه ⇠ ( امام )
]]
H11 =[[
• عكس كلمه ⇠ ( خاين )
]]
H12 =[[
• عكس كلمه ⇠ ( طويل )
]]
H13 =[[
• عكس كلمه ⇠ ( صلب )
]]
H14 =[[
• عكس كلمه ⇠ ( ناعم )
]]
H15 =[[
• عكس كلمه ⇠ ( مجنون )
]]
H16 =[[
• عكس كلمه ⇠ ( غبي )
]]
H17 =[[
• عكس كلمه ⇠ ( ظلمه )
]]
H18 =[[
• عكس كلمه ⇠ ( مسموح )
]]
H19 =[[
• عكس كلمه ⇠ ( ماسمعك )
]]

H20 =[[
• عكس كلمه ⇠ ( تعال )
]]
HUSSEIN = {H16,H17,H18,H19,H20,H1,H2,H3,H4,H5,H6,H7,H8,H9,H11,H12,H13,H14,H15}
local SENDTEXT = HUSSEIN[math.random(#HUSSEIN)]
if SENDTEXT:find('فهمت') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'فهمت') 
elseif SENDTEXT:find('مو جبان') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو جبان') 
elseif SENDTEXT:find('عدل') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'عدل') 
elseif SENDTEXT:find('نشط') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'نشط') 
elseif SENDTEXT:find('مو زين') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو زين') 
elseif SENDTEXT:find('مو عطشان') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو عطشان') 
elseif SENDTEXT:find('حاره') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'حاره') 
elseif SENDTEXT:find('مو خايف') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو خايف') 
elseif SENDTEXT:find('خلف') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'خلف') 
elseif SENDTEXT:find('وفي') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'وفي') 
elseif SENDTEXT:find('قزم') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'قزم') 
elseif SENDTEXT:find('لين') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'لين') 
elseif SENDTEXT:find('خشن') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'خشن') 
elseif SENDTEXT:find('عاقل') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'عاقل') 
elseif SENDTEXT:find('ذكي') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'ذكي') 
elseif SENDTEXT:find('مو ظلمه') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو ظلمه') 
elseif SENDTEXT:find('مو مسموح') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'مو مسموح') 
elseif SENDTEXT:find('اسمعك') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'اسمعك') 
elseif SENDTEXT:find('روح') then
redis:set(boss.."GAME:CHER"..msg.chat_id_,'روح') 
end
sendMsg(msg.chat_id_,msg.id_,SENDTEXT)     
return false  
end
if MsgText[1] == 'نقاطي' then 
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if points and points ~= "0" then
return '*• عدد النقاط التي ربحتها هي ⇠ ( '..points..' ) \n- تسطيع بيع نقاطك ولحصول على ( 100 ) رساله مقابل كل نقطه من النقاط *\n'
else
return ' *• ليس لديك نقاط ،\n- للحصول على النقاط ،\n- ارسل الالعاب وابدأ اللعب ! *'
end
end
if MsgText[1] == 'بيع نقاطي' then
if MsgText[2] == "0" then
return '• هناك خطأ عزيزي  \n- يجب ان يكون البيع ع الاقل 1 من النقاط . 'end
local points = redis:get(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_)
if tonumber(MsgText[2]) > tonumber(points) then
return '• عذرا ليس لديك النقاط بهذا العدد لبيعهن' 
end
if points == "0" then
return '• للاسف ليس لديك النقاط \n- للحصول على النقاط العب احد الالعاب الموجوده في `الالعاب`'
else
local Total_Point = MsgText[2] * 100
redis:decrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,MsgText[2])  
redis:incrby(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_,Total_Point)  
return "• تم خصم (* "..MsgText[2].." *) من نقاطك\n- تم زياده (* "..Total_Point.."* ) من الرسائل \n- اصبحت رسائلك ( *"..redis:get(boss..'msgs:'..msg.sender_user_id_..':'..msg.chat_id_).."* ) رساله "
end
end
if MsgText[1] == "الالعاب" or MsgText[1] == "اللعبه" or MsgText[1] == "اللعبة" then
return [[ 
• قائمة الالعاب 🎖️
ٴ· · • • • ⍒ • • • · ·
• بات
• خمن
• الاسرع
• سمايلات
• المختلف
• امثله
• العكس 
• حزوره
• معاني
• ترتيب
• اسئله
• كت تويت
• احكام
• لو خيروك
]]
end
if MsgText[1] == 'روليت' then
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(boss..':List_Rolet:'..msg.chat_id_)  
redis:setex(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*•* حسننا لنلعب , ارسل عدد اللاعبين للروليت .'
end
if MsgText[1] == 'نعم' and redis:get(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
if #list == 1 then 
return "• لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "• عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(boss..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(boss..':List_Rolet:'..msg.chat_id_) 
redis:del(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_)
return '• تم اختيار الشخص الاتي\n- صاحب الحظ (['..UserName..'])\n- ربحت معنا 5 نقاط' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(boss..':List_Rolet:'..msg.chat_id_) 
local Text = '\n*ٴ· · • • • ⍒ • • • · ·*\n' 
if #list == 0 then 
return '*•* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."• ⇠ [" ..v.."] ⇠\n"  
end 
return Text
end

if MsgText[1] == 'احكام' then
redis:del(boss..":Number_Addh:"..msg.chat_id_..msg.sender_user_id_) 
redis:del(boss..':List_Ahkam:'..msg.chat_id_)  
redis:setex(boss..":Start_Ahkam:"..msg.chat_id_..msg.sender_user_id_,3600,true)  
return '*•* حسننا لنلعب , ارسل عدد اللاعبين للعبة الاحكام .'
end
if MsgText[1] == 'نعم' and redis:get(boss..":Witting_StartGameh:"..msg.chat_id_..msg.sender_user_id_) then
local list = redis:smembers(boss..':List_Ahkam:'..msg.chat_id_) 
if #list == 1 then 
return "• لم يكتمل العدد الكلي للاعبين .!؟" 
elseif #list == 0 then 
return "• عذرا لم تقوم باضافه اي لاعب .؟!" 
end 
local UserName = list[math.random(#list)]
GetUserName(UserName,function(arg,data)
redis:incrby(boss..':User_Points:'..msg.chat_id_..data.id_,5)
end,nil)
redis:del(boss..':List_Ahkam:'..msg.chat_id_) 
redis:del(boss..":Witting_StartGameh:"..msg.chat_id_..msg.sender_user_id_)
return '• تم اختيار الشخص الاتي\n- العضو (['..UserName..'])\n- تم اختياره للحكم عليه' 
end
if MsgText[1] == 'الاعبين' then
local list = redis:smembers(boss..':List_Ahkam:'..msg.chat_id_) 
local Text = '\n*ٴ· · • • • ⍒ • • • · ·*\n' 
if #list == 0 then 
return '*•* لا يوجد لاعبين هنا ' 
end 
for k, v in pairs(list) do 
Text = Text..k.."• ⇠ [" ..v.."] ⇠\n"  
end 
return Text
end

if MsgText[1] == 'قائمه الالعاب' then
sendMsg(msg.chat_id_,msg.id_,[[
• قائمة الالعاب 🎖️
ٴ· · • • • ⍒ • • • · ·
• بات
• خمن
• الاسرع
• سمايلات
• المختلف
• امثله
• العكس 
• حزوره
• معاني
• ترتيب
• اسئله
• كت تويت
• احكام
• لو خيروك
]])
end
end
end
end
local function procces(msg)
if msg.text and not redis:get(boss..'lock_geams'..msg.chat_id_) then
if msg.text == redis:get(boss..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end

if msg.text == redis:get(boss..':Set_Amthlh:'..msg.chat_id_) then -- // امثله
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Amthlh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end

if msg.text == redis:get(boss..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end


if msg.text == redis:get(boss..':Set_Smile:'..msg.chat_id_) then --//  الاسرع
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Smile:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end 
if msg.text == redis:get(boss..':Set_alii:'..msg.chat_id_) then -- // المختلف
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_alii:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end 
if msg.text == redis:get(boss..':Set_Hzorh:'..msg.chat_id_) then -- // حزوره
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Hzorh:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end 
if msg.text == redis:get(boss..':Set_Arg:'..msg.chat_id_) then -- // الترتيب
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Arg:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end 
if msg.text == redis:get(boss..':Set_Name_Meant:'..msg.chat_id_) then --// المعاني
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss..':Set_Name_Meant:'..msg.chat_id_)
return sendMsg(msg.chat_id_,msg.id_,'*• احسنت اجابتك صحيحه *')
end 
if msg.text:match("^(%d+)$") and redis:get(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*•* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '• تم بدء تسجيل اللسته \n- يرجى ارسال المعرفات \n- الفائز يحصل على ( 5 ) مجوهره\n- عدد الاعبين المطلوبه ( *'..msg.text..'* ) لاعب 🏹'
end
redis:del(boss..":Start_Rolet:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(boss..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*•* المعرف (['..msg.text..']) موجود اساسا' )
end
redis:sadd(boss..':List_Rolet:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(boss..':List_Rolet:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(boss..":Number_Add:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(boss..":Witting_StartGame:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"*•* تم ادخال المعرف ( ["..msg.text.."] ) \n*-* وتم اكتمال العدد الكلي \n- هل انت مستعد ؟ اجب بـ (* نعم *)")
end 
return sendMsg(msg.chat_id_,msg.id_,"*•* تم ادخال المعرف ( ["..msg.text.."] ) \n- تبقى ( *"..CountUser.."* ) لاعبين ليكتمل العدد\n- ارسل المعرف التالي ")
end

------- احكام --------

if msg.text:match("^(%d+)$") and redis:get(boss..":Start_Ahkam:"..msg.chat_id_..msg.sender_user_id_) then  --// استقبال اللعبه الدمبله
if msg.text == "1" then
Text = "*•* لا استطيع بدء اللعبه بلاعب واحد فقط\n"
else
redis:set(boss..":Number_Addh:"..msg.chat_id_..msg.sender_user_id_,msg.text)  
Text = '• تم بدء تسجيل اللسته \n- يرجى ارسال المعرفات \n- الشخص المختار يتم الحكم عليه\n- عدد الاعبين المطلوبه ( *'..msg.text..'* ) لاعب '
end
redis:del(boss..":Start_Ahkam:"..msg.chat_id_..msg.sender_user_id_)  
return sendMsg(msg.chat_id_,msg.id_,Text)    
end
if msg.text:match('^(@[%a%d_]+)$') and redis:get(boss..":Number_Addh:"..msg.chat_id_..msg.sender_user_id_) then    --// استقبال الاسماء
if redis:sismember(boss..':List_Rolet:'..msg.chat_id_,msg.text) then
return sendMsg(msg.chat_id_,msg.id_,'*•* المعرف (['..msg.text..']) موجود اساسا' )
end
redis:sadd(boss..':List_Ahkam:'..msg.chat_id_,msg.text)
local CountAdd = redis:get(boss..":Number_Addh:"..msg.chat_id_..msg.sender_user_id_)
local CountAll = redis:scard(boss..':List_Ahkam:'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
redis:del(boss..":Number_Addh:"..msg.chat_id_..msg.sender_user_id_) 
redis:setex(boss..":Witting_StartGameh:"..msg.chat_id_..msg.sender_user_id_,1400,true)  
return sendMsg(msg.chat_id_,msg.id_,"*•* تم ادخال المعرف ( ["..msg.text.."] ) \n*-* وتم اكتمال العدد الكلي \n- هل انت مستعد لاختيار الشخص المحكوم عليه ؟ اجب بـ (* نعم *)")
end 
return sendMsg(msg.chat_id_,msg.id_,"*•* تم ادخال المعرف ( ["..msg.text.."] ) \n- تبقى ( *"..CountUser.."* ) لاعبين ليكتمل العدد\n- ارسل المعرف التالي ")
end

---------

if redis:get(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 50000 then
sendMsg(msg.chat_id_,msg.id_,"*• لا تستطيع اضافة اكثر من 50000 رساله *")   
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n*• تم اضافة ( "..msg.text.." ) رساله له*")
redis:incrby(boss..'msgs:'..GET_IDUSER..':'..msg.chat_id_,msg.text)  
end
redis:del(boss.."SETEX:MSG"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_) then 
if msg.text:match("^(%d+)$") then
if tonumber(msg.text:match("^(%d+)$")) > 1000 then
sendMsg(msg.chat_id_,msg.id_,"*• لا تستطيع اضافة اكثر من 1000 نقطه *")   
redis:del(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
return false  end 
local GET_IDUSER = redis:get(boss..'SET:ID:USER:NUM'..msg.chat_id_)  
sendMsg(msg.chat_id_,msg.id_,"\n*• تم اضافة ( "..msg.text.." ) نقطه له*")
redis:incrby(boss..':User_Points:'..msg.chat_id_..GET_IDUSER,msg.text)  
end
redis:del(boss.."SETEX:NUM"..msg.chat_id_..""..msg.sender_user_id_)  
end
if redis:get(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 6 then
sendMsg(msg.chat_id_,msg.id_,"*• عذرا لا يوجد سواء ( 6 ) اختيارات فقط ارسل اختيارك مره اخره*\n")   
return false  end 
local GETNUM = redis:get(boss.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'*• مبروك فزت وطلعت المحيبس بل ايد رقم ( '..NUM..' )\n- لقد حصلت على ( 3 ) من نقاط يمكنك استبدالهن برسائل *')   
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,3)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:del(boss.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*• للاسف لقد خسرت \n- المحيبس بل ايد رقم ( '..GETNUM..' )\n- حاول مره اخرى للعثور على المحيبس *')   
end
end
end
if (msg.text == redis:get(boss.."GAME:CHER"..msg.chat_id_)) and redis:get(boss.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه كفووو ')     
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss.."GAME:S"..msg.chat_id_)
redis:del(boss.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'الفيل' or msg.text == 'الثور' or msg.text == 'الحصان' or msg.text == '7' or msg.text == '9' or msg.text == '8' or msg.text == 'لوين' or msg.text == 'موسكو' or msg.text == 'مانكو' or msg.text == '20' or msg.text == '30' or msg.text == '28' or msg.text == 'ترامب' or msg.text == 'اوباما' or msg.text == 'كيم جونغ' or msg.text == '50' or msg.text == '70' or msg.text == '40' or msg.text == '7' or msg.text == '3' or msg.text == '10' or msg.text == '4' or msg.text == 'الاذن' or msg.text == 'الثلاجه' or msg.text == 'الغرفه' or msg.text == '15' or msg.text == '17' or msg.text == '25' or msg.text == 'الفرات' or msg.text == 'نهر الكونغو' or msg.text == 'المسيبي' or msg.text == 'بيا بايج' or msg.text == 'لاري بيج' or msg.text == 'بيا مارك زوكيربرج' or msg.text == 'الفيل' or msg.text == 'النمر' or msg.text == 'الفهد' or msg.text == 'بانكول' or msg.text == 'نيو دلهي' or msg.text == 'بيكن' or msg.text == 'الهاتف' or msg.text == 'التلفاز' or msg.text == 'المذياع' or msg.text == 'لفرسول' or msg.text == 'تركيا' or msg.text == 'بغداد' or msg.text == 'النحاس' or msg.text == 'الحديد' or msg.text == 'الفضه' or msg.text == 'امريكا الشماليه' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'القرش' or msg.text == 'الثعلب' or msg.text == 'الكلب' or msg.text == 'للجرو' or msg.text == 'العجل' or msg.text == 'الحمار' or msg.text == '3' or msg.text == '5' or msg.text == '6' or msg.text == 'اوربا' or msg.text == 'افريقيا' or msg.text == 'امريكا الجنوبيه' or msg.text == 'افريقيا' or msg.text == 'امريكا الشماليه' or msg.text == 'اوربا' or msg.text == 'الصاروخ' or msg.text == 'المسدس' or msg.text == 'الطائرات' or msg.text == 'سيدات' or msg.text == 'قوانص' or msg.text == 'عوانس' or msg.text == 'المكارم' or msg.text == 'المبائم' or msg.text == 'المعازم' or msg.text == 'حرف الغاء' or msg.text == 'حرف الواو' or msg.text == 'حرف النون' or msg.text == 'نحاس' or msg.text == 'الماس' or msg.text == 'حديد' or msg.text == 'العمر' or msg.text == 'ساعه' or msg.text == 'الحذاء' or msg.text == 'بئر' or msg.text == 'نهر' or msg.text == 'شلال' or msg.text == 'ادم' or msg.text == 'نوح' or msg.text == 'عيسئ' or msg.text == 'الاضافر' or msg.text == 'الاسنان' or msg.text == 'الدموع' or msg.text == 'الاخلاق' or msg.text == 'الضل' or msg.text == 'حرف النون'  then
if redis:get(boss.."GAME:S"..msg.chat_id_) then  
local list = {'10' , 'براسي' , 'النمل' , '32' , 'بوتين' , '30' , '11' , 'الفم' , '14' , 'النيل' , 'ستيف جوبر' , 'خديجه' , 'الاسد' , 'طوكيو' , 'الانسان' , 'لندن' , 'الزئبق' , 'اورباالدولفين' , 'المهر' , '4' , 'اسيا' , 'اسيا' , 'المنجنيق' , 'انسات' , 'العزائم' , 'حرف الام' , 'ذهب' , 'الاسم' , 'سحاب' , 'ابراهيم' , 'الشعر' , 'حرف الواو'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'• اجابتك غلطططط فشلتنا ')     
redis:del(boss.."GAME:S"..msg.chat_id_)
redis:del(boss.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if (msg.text == redis:get(boss.."GAME:CHER"..msg.chat_id_)) and redis:get(boss.."GAME:S"..msg.chat_id_) then  
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه كفووو ')     
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss.."GAME:S"..msg.chat_id_)
redis:del(boss.."GAME:CHER"..msg.chat_id_)
elseif msg.text == 'فهمت' or msg.text == 'مو جبان' or msg.text == 'عدل' or msg.text == 'نشط' or msg.text == 'مو زين' or msg.text == 'مو عطشان' or msg.text == 'حاره' or msg.text == 'مو خايف' or msg.text == 'خلف' or msg.text == 'وفي' or msg.text == 'القزم' or msg.text == 'لين' or msg.text == 'خشن' or msg.text == 'عاقل' or msg.text == 'ذكي' or msg.text == 'مو ظلمه' or msg.text == 'مو مسموح' or msg.text == 'اسمعك' or msg.text == 'روح' then
if redis:get(boss.."GAME:S"..msg.chat_id_) then  
local list = {'فهمت' , 'مو جبان' , ' مو عطشان' , 'عدل' , 'نشط' , 'مو زين' , ' خاره ' , 'خلف' , 'مو خايف' , 'لين' , 'القزم' , 'وفي' , 'عاقل' , 'خشن' , 'ذكي' , 'اسمعك' , 'مو مسموح' , 'مو ظلمه'}
for k, v in pairs(list) do 
if msg.text ~= v then
sendMsg(msg.chat_id_,msg.id_,'• اجابتك صحيحه كفووو ')     
redis:incrby(boss..':User_Points:'..msg.chat_id_..msg.sender_user_id_,1)  
redis:del(boss.."GAME:S"..msg.chat_id_)
redis:del(boss.."GAME:CHER"..msg.chat_id_)
return false  
end
end
end
end
if redis:get(boss.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if msg.text:match("^(%d+)$") then
local NUM = msg.text:match("^(%d+)$")
if tonumber(NUM) > 20 then
sendMsg(msg.chat_id_,msg.id_,"*• عذرآ لا يمكنك تخمين عدد اكبر من ال ( 20 ) خمن رقم ما بين ( 1 و 20 ) *\n")
return false  end 
local GETNUM = redis:get(boss.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
redis:del(boss..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
redis:incrby(boss..':User_Points:'..msg.chat_id_..data.id_,5)
sendMsg(msg.chat_id_,msg.id_,'*• مبروك فزت ويانه وخمنت الرقم الصحيح\n- تم اضافة ( 5 ) من النقاط *\n')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
redis:incrby(boss..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(redis:get(boss..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
redis:del(boss..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
redis:del(boss.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
sendMsg(msg.chat_id_,msg.id_,'\n*• اوبس لقد خسرت في اللعبه \n- حظآ اوفر في المره القادمه \n- كان الرقم الذي تم تخمينه ( '..GETNUM..' )\n ')
else
sendMsg(msg.chat_id_,msg.id_,'\n*• اوبس تخمينك غلط \n- ارسل رقم تخمنه مره اخره \n ')
end
end
end
end
end



end
return {
Boss = {
"^(حزوره)$", 
"^(المختلف)$",
"^(امثله)$",
"^(نعم)$",
"^(الاعبين)$",
"^(بدء الاسئله)$",
"^(ختيارات)$",
"^(اسئله)$",
"^(الالعاب)$",
"^(محيبس)$",
"^(تخمين)$",
"^(خمن)$",
"^(بات)$",
'^(تعطيل) (.+)$',
'^(تفعيل) (.+)$',
"^(اسرع)$",
"^(الاسرع)$",
"^(نقاطي)$",
"^(ترتيب)$",
"^(كت تويت)$",
"^(تويت)$",
"^(معاني)$",
"^(لو خيروك)$",
"^(لوخيروك)$",
"^(عكس)$",
"^(احكام)$",
"^(العكس)$", 
"^(العكسس)$", 
"^(بيع نقاطي) (%d+)$",
"^(اضف رسائل) (%d+)$",
"^(اضف نقاط) (%d+)$",
"^(روليت)$",
"^(اسئله)$",
"^(قائمه الالعاب)$",
},
iBoss = games,
dBoss = procces,
}
