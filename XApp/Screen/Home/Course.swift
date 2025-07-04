//
//  Course.swift
//  XApp
//
//  Created by Roy on 18/6/2025.
//

import SwiftUI

struct Course: Identifiable {
  let id = UUID()
  let title: String
  let subTitle: String
  let text: String
  let image: String
  let bgImage: String

  let author: String
  let avater: String

  let heroIntroduction: String
  let heroPosition: String
  let heroSkill: String
}

var courses = [
  Course(
    title: "橘右京",
    subTitle: "3 sections - 9m",
    text: "在近江的村落里，没落的武士后裔橘右京，却有着高超的剑术 “神梦想一刀流”，是远近闻名的居合斩名家。他温柔文雅的容貌，俘获了许多少女的芳心。她们所不知道的是，右京因为肺病的折磨，陷入深深的空虚与孤独感，认为自己会独自死去。",
    image: "jyj",
    bgImage: "wzry_bg1",

    author: "国服第一橘右京",
    avater: "defAvater",

    heroIntroduction: "橘右京是一名以技能攻击为主的战士。人如其名，橘右京的每一次进攻都极具爆发力。橘右京需要时刻把控自己与目标的位置处于中距离，才能够将技能的效果发挥到极致，一旦橘右京连续使出拔刀斩，将会对敌人造成成吨的伤害。但是橘右京被敌人贴身以后，将处于非常危险的境地，这时橘右京可以快速释放燕返来进行后撤，让自己始终保持在最佳位置来攻击敌人。橘右京是一名以技能攻击为主的战士。人如其名，橘右京的每一次进攻都极具爆发力。橘右京需要时刻把控自己与目标的位置处于中距离，才能够将技能的效果发挥到极致，一旦橘右京连续使出拔刀斩，将会对敌人造成成吨的伤害。但是橘右京被敌人贴身以后，将处于非常危险的境地，这时橘右京可以快速释放燕返来进行后撤，让自己始终保持在最佳位置来攻击敌人。",
    heroPosition: "橘右京在战士刺客类的英雄中，生存能力和攻击效果都属于中上游，上手难度也不高，是一个比较容易上手且很强势的英雄。而且橘右京的成长属性值很高，提升等级对橘右京来说就显得很重要，所以前期可以多多的打野发育，利用技能CD短快速打野提升等级，这样在单挑或是团战中都不惧任何英雄了。",
    heroSkill: "橘右京在释放技能时要注意被动和二技能的使用，做到控制和留住敌人，然后用大招的高额伤害来打输出。技能连招顺序是：秘剑胧刀-居合-燕返-细雪，这样可以很好的控住敌人然后打输出，让敌人逃不了也不好反抗 。"
  ),
  Course(
    title: "公孙离",
    subTitle: "5 sections - 15m",
    text: "阿离是个被教坊收养的兔子魔种。即便在无比清苦的岁月中，年少的阿离也曾在心里埋下过仰慕的身影和憧憬的对象。而这些成长中的印记，潜移默化地影响着阿离，终于有一天，让她代替了那些曾经离开的人，成为长安舞台上新的焦点。也进入了她们曾经逃离的，那些传说中的位于暗面的世界。",
    image: "gsl",
    bgImage: "wzry_bg2",

    author: "国服第一阿离",
    avater: "defAvater",

    heroIntroduction: "阿离属于灵活输出型射手英雄，在短时间内让敌人叠满4次印记，打出爆发伤害。",
    heroPosition: "阿离不同的技能对纸伞的位置影响是不同的，释放技能时尽量考虑纸伞将来的轨迹。纸伞的轨迹大概可以判断阿离的想法，提前预判即可防范于未然。",
    heroSkill: "阿离手持纸伞时，技能可连续释放两次，在短时间内让敌人叠满4次印记，打出爆发伤害。公孙离的敏捷是她在游戏中最为核心的体验。她的技能都能将纸伞掷出一段时间，并在回收之前使用技能跳跃到纸伞的位置。"
  ),
  Course(
    title: "狄仁杰",
    subTitle: "4 sections - 11m",
    text: "长安，大宗师墨子亲手建造的大陆第一繁华的伟大城市，东方大陆最强帝国强盛实力的象征。尽管如此，它光辉的雄姿背后依旧免不了阴霾与暗影。以雷厉风行的姿态守护长安和平的，不是战功赫赫的将军，不是至高无上的帝王，而是人称强迫症名侦探的狄仁杰。",
    image: "dyj",
    bgImage: "wzry_bg3",

    author: "国服第一狄仁杰",
    avater: "defAvater",

    heroIntroduction: "狄仁杰，腾讯手游《王者荣耀》中的一名英雄角色，定位为射手，原型是唐朝政治家狄仁杰。",
    heroPosition: "狄仁杰有着和其他射手一样的射程优势，却又有着近战的爆发和控制技能，非常适合远程输出。他拥有1技能的AOE伤害和2技能的解控效果，不断的走A（移动同时普攻输出）可以使狄仁杰无论是抓人还是逃跑都更加灵活，大招加强了他打前排的能力。",
    heroSkill: "开局先平空A攒五层被动。狄仁杰1技能清线能力很强，可以快速清理兵线。狄仁杰需要谨慎走位，因为1技能位移很短。2技能可以在被控制后使用。在二技能使用的一瞬间有大约0.5秒的无敌时间。狄仁杰因为没有较远的位移，建议携带闪现。"
  ),
  Course(
    title: "后羿",
    subTitle: "3 sections - 12m",
    text: "茫茫时空中，渺小蔚蓝的星球上，曾存在着遥远的时代……到达巅峰后一夕毁灭的时代。过去的文明湮灭在时光中，新的生命从新的大陆中生存，繁盛。而引领他们的，是乘坐方舟降临的“超智慧生命体”。",
    image: "hy",
    bgImage: "wzry_bg4",

    author: "国服第一后羿",
    avater: "defAvater",

    heroIntroduction: "后羿属于持续输出型射手英雄，作为一名依赖普攻的高爆发射手，攻速、暴击和移速等属性，在团战中作用很大。",
    heroPosition: "后羿具备一个被动技能与三个主动技能。每当他的普通攻击触及敌人，其攻击速度会提升，这种效果能累积三层。在累积到三层时，他的每次普攻都将同时释放三支箭（且每次成功击中敌人都会重置这个效果的持续时间）。他的多重箭技能能强化攻击，使每次攻击都能对前方区域内的另两名敌人造成普通攻击的效果。此外，后羿还能施展落日余晖，指挥日之塔对特定区域发动攻击，稍后便会召唤激光束打击该区域，对受击敌人造成法术伤害、减速，并附加额外伤害。最后，使用火鸟之翼技能时，后羿会射出火焰箭，若击中敌方英雄，将造成物理伤害并使其晕眩，同时对其周围的敌人造成范围伤害。",
    heroSkill: "在触发被动惩戒射击以后，再开启1技能-多重箭矢可以让后羿的普攻输出达到最大化。4级前，是后羿的强势期，中端局辅助一般跟射手。这个时候后羿可以凭借惊人持续输出能力虐暴上单和打野。高端局辅助和打野肯定会到处gank，后羿看看打不过上单就守塔，等着自己波打野抓。打得过就猥琐一点，防止被抓。到达4级以后，时刻关注场上的变化，必要的时候利用大招支援队友。后羿被动射出的三只箭矢是可以触发末世的被动效果，并且可以触发两次。也就是说一次攻击可以造成两次敌人当前生命值8%的物理伤害,对付坦克效果很好。因此最好带吸血铭文出末世。"
  )
]

var featureCourses = [
  Course(
    title: "橘右京",
    subTitle: "3 sections - 9m",
    text: "在近江的村落里，没落的武士后裔橘右京，却有着高超的剑术 “神梦想一刀流”，是远近闻名的居合斩名家。他温柔文雅的容貌，俘获了许多少女的芳心。她们所不知道的是，右京因为肺病的折磨，陷入深深的空虚与孤独感，认为自己会独自死去。",
    image: "jyj",
    bgImage: "wzry_bg1",

    author: "国服第一橘右京",
    avater: "defAvater",

    heroIntroduction: "橘右京是一名以技能攻击为主的战士。人如其名，橘右京的每一次进攻都极具爆发力。橘右京需要时刻把控自己与目标的位置处于中距离，才能够将技能的效果发挥到极致，一旦橘右京连续使出拔刀斩，将会对敌人造成成吨的伤害。但是橘右京被敌人贴身以后，将处于非常危险的境地，这时橘右京可以快速释放燕返来进行后撤，让自己始终保持在最佳位置来攻击敌人。橘右京是一名以技能攻击为主的战士。人如其名，橘右京的每一次进攻都极具爆发力。橘右京需要时刻把控自己与目标的位置处于中距离，才能够将技能的效果发挥到极致，一旦橘右京连续使出拔刀斩，将会对敌人造成成吨的伤害。但是橘右京被敌人贴身以后，将处于非常危险的境地，这时橘右京可以快速释放燕返来进行后撤，让自己始终保持在最佳位置来攻击敌人。",
    heroPosition: "橘右京在战士刺客类的英雄中，生存能力和攻击效果都属于中上游，上手难度也不高，是一个比较容易上手且很强势的英雄。而且橘右京的成长属性值很高，提升等级对橘右京来说就显得很重要，所以前期可以多多的打野发育，利用技能CD短快速打野提升等级，这样在单挑或是团战中都不惧任何英雄了。",
    heroSkill: "橘右京在释放技能时要注意被动和二技能的使用，做到控制和留住敌人，然后用大招的高额伤害来打输出。技能连招顺序是：秘剑胧刀-居合-燕返-细雪，这样可以很好的控住敌人然后打输出，让敌人逃不了也不好反抗 。"
  ),
  Course(
    title: "公孙离",
    subTitle: "5 sections - 15m",
    text: "阿离是个被教坊收养的兔子魔种。即便在无比清苦的岁月中，年少的阿离也曾在心里埋下过仰慕的身影和憧憬的对象。而这些成长中的印记，潜移默化地影响着阿离，终于有一天，让她代替了那些曾经离开的人，成为长安舞台上新的焦点。也进入了她们曾经逃离的，那些传说中的位于暗面的世界。",
    image: "gsl",
    bgImage: "wzry_bg2",

    author: "国服第一阿离",
    avater: "defAvater",

    heroIntroduction: "阿离属于灵活输出型射手英雄，在短时间内让敌人叠满4次印记，打出爆发伤害。",
    heroPosition: "阿离不同的技能对纸伞的位置影响是不同的，释放技能时尽量考虑纸伞将来的轨迹。纸伞的轨迹大概可以判断阿离的想法，提前预判即可防范于未然。",
    heroSkill: "阿离手持纸伞时，技能可连续释放两次，在短时间内让敌人叠满4次印记，打出爆发伤害。公孙离的敏捷是她在游戏中最为核心的体验。她的技能都能将纸伞掷出一段时间，并在回收之前使用技能跳跃到纸伞的位置。"
  ),
  Course(
    title: "狄仁杰",
    subTitle: "4 sections - 11m",
    text: "长安，大宗师墨子亲手建造的大陆第一繁华的伟大城市，东方大陆最强帝国强盛实力的象征。尽管如此，它光辉的雄姿背后依旧免不了阴霾与暗影。以雷厉风行的姿态守护长安和平的，不是战功赫赫的将军，不是至高无上的帝王，而是人称强迫症名侦探的狄仁杰。",
    image: "dyj",
    bgImage: "wzry_bg3",

    author: "国服第一狄仁杰",
    avater: "defAvater",

    heroIntroduction: "狄仁杰，腾讯手游《王者荣耀》中的一名英雄角色，定位为射手，原型是唐朝政治家狄仁杰。",
    heroPosition: "狄仁杰有着和其他射手一样的射程优势，却又有着近战的爆发和控制技能，非常适合远程输出。他拥有1技能的AOE伤害和2技能的解控效果，不断的走A（移动同时普攻输出）可以使狄仁杰无论是抓人还是逃跑都更加灵活，大招加强了他打前排的能力。",
    heroSkill: "开局先平空A攒五层被动。狄仁杰1技能清线能力很强，可以快速清理兵线。狄仁杰需要谨慎走位，因为1技能位移很短。2技能可以在被控制后使用。在二技能使用的一瞬间有大约0.5秒的无敌时间。狄仁杰因为没有较远的位移，建议携带闪现。"
  ),
  Course(
    title: "后羿",
    subTitle: "3 sections - 12m",
    text: "茫茫时空中，渺小蔚蓝的星球上，曾存在着遥远的时代……到达巅峰后一夕毁灭的时代。过去的文明湮灭在时光中，新的生命从新的大陆中生存，繁盛。而引领他们的，是乘坐方舟降临的“超智慧生命体”。",
    image: "hy",
    bgImage: "wzry_bg4",

    author: "国服第一后羿",
    avater: "defAvater",

    heroIntroduction: "后羿属于持续输出型射手英雄，作为一名依赖普攻的高爆发射手，攻速、暴击和移速等属性，在团战中作用很大。",
    heroPosition: "后羿具备一个被动技能与三个主动技能。每当他的普通攻击触及敌人，其攻击速度会提升，这种效果能累积三层。在累积到三层时，他的每次普攻都将同时释放三支箭（且每次成功击中敌人都会重置这个效果的持续时间）。他的多重箭技能能强化攻击，使每次攻击都能对前方区域内的另两名敌人造成普通攻击的效果。此外，后羿还能施展落日余晖，指挥日之塔对特定区域发动攻击，稍后便会召唤激光束打击该区域，对受击敌人造成法术伤害、减速，并附加额外伤害。最后，使用火鸟之翼技能时，后羿会射出火焰箭，若击中敌方英雄，将造成物理伤害并使其晕眩，同时对其周围的敌人造成范围伤害。",
    heroSkill: "在触发被动惩戒射击以后，再开启1技能-多重箭矢可以让后羿的普攻输出达到最大化。4级前，是后羿的强势期，中端局辅助一般跟射手。这个时候后羿可以凭借惊人持续输出能力虐暴上单和打野。高端局辅助和打野肯定会到处gank，后羿看看打不过上单就守塔，等着自己波打野抓。打得过就猥琐一点，防止被抓。到达4级以后，时刻关注场上的变化，必要的时候利用大招支援队友。后羿被动射出的三只箭矢是可以触发末世的被动效果，并且可以触发两次。也就是说一次攻击可以造成两次敌人当前生命值8%的物理伤害,对付坦克效果很好。因此最好带吸血铭文出末世。"
  )
]
