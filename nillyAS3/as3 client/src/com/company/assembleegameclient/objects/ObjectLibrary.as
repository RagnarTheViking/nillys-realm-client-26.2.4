package com.company.assembleegameclient.objects
{
   import flash.utils.Dictionary;
   import _0cH_._1O_F_;
   import flash.utils.getDefinitionByName;
   import flash.display.BitmapData;
   import com.company.util.TextureLibrary;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import _0R_W_._0R_c;
   import _1pm._0P_M_;
   import _1pm._1Y_F_;
   import com.company.util.ConversionUtil;
   import _7m.StatData;
   
   public class ObjectLibrary
   {
      
      public static const _qv:String = "lofiObj3";
      
      public static const _1qM_:int = 255;
      
      public static const _01A_:Dictionary = new Dictionary();
      
      public static const XmlData:Dictionary = new Dictionary();
      
      public static const _07h:Dictionary = new Dictionary();
      
      public static const _O_S_:Dictionary = new Dictionary();
      
      public static const _1eh:Dictionary = new Dictionary();
      
      public static const _1eB_:Dictionary = new Dictionary();
      
      public static const _0ld:Dictionary = new Dictionary();
      
      public static const _jf:Dictionary = new Dictionary();
      
      public static const EquipmentSetSkin:Dictionary = new Dictionary();
      
      public static const _0Y_5:com.company.assembleegameclient.objects.ObjectProperties = new com.company.assembleegameclient.objects.ObjectProperties(null);
      
      public static const _1nc:Object = {
         "ArenaGuard":ArenaGuard,
         "ArenaPortal":ArenaPortal,
         "CaveWall":CaveWall,
         "Character":Character,
         "CharacterChanger":CharacterChanger,
         "ClosedGiftChest":ClosedGiftChest,
         "ClosedVaultChest":ClosedVaultChest,
         "ConnectedWall":ConnectedWall,
         "Container":Container,
         "DoubleWall":DoubleWall,
         "FortuneGround":FortuneGround,
         "FortuneTeller":FortuneTeller,
         "GameObject":GameObject,
         "GuildBoard":GuildBoard,
         "GuildChronicle":GuildChronicle,
         "GuildHallPortal":GuildHallPortal,
         "GuildMerchant":GuildMerchant,
         "GuildRegister":GuildRegister,
         "MarketNPC":MarketNPC,
         "Merchant":Merchant,
         "MoneyChanger":MoneyChanger,
         "MysteryBoxGround":MysteryBoxGround,
         "NameChanger":NameChanger,
         "ReskinVendor":ReskinVendor,
         "OneWayContainer":OneWayContainer,
         "Player":Player,
         "Portal":Portal,
         "Projectile":Projectile,
         "QuestRewards":QuestRewards,
         "Sign":Sign,
         "SpiderWeb":SpiderWeb,
         "Stalagmite":Stalagmite,
         "Wall":Wall,
         "Pet":Pet,
         "PetUpgrader":PetUpgrader,
         "YardUpgrader":YardUpgrader
      };
      
      public static var _1e__:com.company.assembleegameclient.objects._0D_A_ = new com.company.assembleegameclient.objects._0D_A_();
      
      public static var _1bS_:Vector.<XML> = new Vector.<XML>();
      
      public static var _1cw:Vector.<XML> = new Vector.<XML>();
      
      public static var _0sC_:Dictionary = new Dictionary();
       
      
      public function ObjectLibrary()
      {
         super();
      }
      
      public static function add(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:int = 0;
         var _loc6_:Boolean = false;
         var _loc7_:int = 0;
         for each(_loc2_ in param1.Object)
         {
            _loc3_ = String(_loc2_.@id);
            _loc4_ = _loc3_;
            if(_loc2_.hasOwnProperty("DisplayId"))
            {
               _loc4_ = _loc2_.DisplayId;
            }
            if(_loc2_.hasOwnProperty("Group"))
            {
               if(_loc2_.Group == "Hexable")
               {
                  _1cw.push(_loc2_);
               }
            }
            _loc5_ = int(_loc2_.@type);
            if(_loc2_.hasOwnProperty("PetBehavior") || _loc2_.hasOwnProperty("PetAbility"))
            {
               _jf[_loc5_] = _loc2_;
            }
            else
            {
               _01A_[_loc5_] = new com.company.assembleegameclient.objects.ObjectProperties(_loc2_);
               XmlData[_loc5_] = _loc2_;
               _07h[_loc3_] = _loc5_;
               _O_S_[_loc5_] = _loc4_;
               if(String(_loc2_.Class) == "Player")
               {
                  _0sC_[_loc5_] = String(_loc2_.@id).substr(0,2);
                  _loc6_ = false;
                  _loc7_ = 0;
                  while(_loc7_ < _1bS_.length)
                  {
                     if(int(_1bS_[_loc7_].@type) == _loc5_)
                     {
                        _1bS_[_loc7_] = _loc2_;
                        _loc6_ = true;
                     }
                     _loc7_++;
                  }
                  if(!_loc6_)
                  {
                     _1bS_.push(_loc2_);
                  }
               }
               _1eh[_loc5_] = _1e__.create(_loc2_);
               if(_loc2_.hasOwnProperty("Top"))
               {
                  _1eB_[_loc5_] = _1e__.create(XML(_loc2_.Top));
               }
               if(_loc2_.hasOwnProperty("Animation"))
               {
                  _0ld[_loc5_] = new _1O_F_(_loc2_);
               }
            }
         }
      }
      
      public static function _M_(param1:int) : String
      {
         var _loc2_:XML = XmlData[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return String(_loc2_.@id);
      }
      
      public static function _1pW_(param1:String) : com.company.assembleegameclient.objects.ObjectProperties
      {
         var _loc2_:int = _07h[param1];
         return _01A_[_loc2_];
      }
      
      public static function _0W_b(param1:String) : XML
      {
         var _loc2_:int = _07h[param1];
         return XmlData[_loc2_];
      }
      
      public static function _1zA_(param1:int) : GameObject
      {
         var _loc2_:XML = XmlData[param1];
         var _loc3_:String = _loc2_.Class;
         var _loc4_:Class = _1nc[_loc3_] || _1U_k(_loc3_);
         return new _loc4_(_loc2_);
      }
      
      private static function _1U_k(param1:String) : Class
      {
         var _loc2_:String = "com.company.assembleegameclient.objects." + param1;
         return getDefinitionByName(_loc2_) as Class;
      }
      
      public static function getTextureFromType(param1:int) : BitmapData
      {
         var _loc2_:_sV_ = _1eh[param1];
         if(_loc2_ == null)
         {
            return null;
         }
         return _loc2_.getTexture();
      }
      
      public static function getBitmapData(param1:int) : BitmapData
      {
         var _loc2_:_sV_ = _1eh[param1];
         var _loc3_:BitmapData = !!_loc2_?_loc2_.getTexture():null;
         if(_loc3_)
         {
            return _loc3_;
         }
         return TextureLibrary.getBitmap(_qv,_1qM_);
      }
      
      public static function getRedrawnTextureFromType(param1:int, param2:int, param3:Boolean, param4:Boolean = true, param5:Number = 5) : BitmapData
      {
         var _loc6_:BitmapData = getBitmapData(param1);
         var _loc7_:_sV_ = _1eh[param1];
         var _loc8_:BitmapData = !!_loc7_?_loc7_.mask_:null;
         if(_loc8_ == null)
         {
            return TextureRedrawer.redraw(_loc6_,param2,param3,0,param4,param5);
         }
         var _loc9_:XML = XmlData[param1];
         var _loc10_:int = !!_loc9_.hasOwnProperty("Tex1")?int(int(_loc9_.Tex1)):0;
         var _loc11_:int = !!_loc9_.hasOwnProperty("Tex2")?int(int(_loc9_.Tex2)):0;
         _loc6_ = TextureRedrawer.resize(_loc6_,_loc8_,param2,param3,_loc10_,_loc11_,param5);
         _loc6_ = _0R_c._1iY_(_loc6_,0);
         return _loc6_;
      }
      
      public static function _0ye(param1:int) : int
      {
         var _loc2_:XML = XmlData[param1];
         if(!_loc2_.hasOwnProperty("Size"))
         {
            return 100;
         }
         return int(_loc2_.Size);
      }
      
      public static function _zV_(param1:int) : int
      {
         var _loc2_:XML = XmlData[param1];
         if(!_loc2_.hasOwnProperty("SlotType"))
         {
            return -1;
         }
         return int(_loc2_.SlotType);
      }
      
      public static function _A___(param1:int, param2:Player) : Boolean
      {
         var _loc5_:uint = 0;
         if(param1 == _0P_M_._F_p)
         {
            return false;
         }
         var _loc3_:XML = XmlData[param1];
         var _loc4_:int = int(_loc3_.SlotType.toString());
         while(_loc5_ < _1Y_F_._J_p)
         {
            if(param2._01e[_loc5_] == _loc4_)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public static function _bc(param1:int, param2:Player) : int
      {
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         if(param1 != _0P_M_._F_p)
         {
            _loc3_ = XmlData[param1];
            _loc4_ = int(_loc3_.SlotType);
            _loc5_ = 0;
            while(_loc5_ < _1Y_F_._J_p)
            {
               if(param2._01e[_loc5_] == _loc4_)
               {
                  return _loc5_;
               }
               _loc5_++;
            }
         }
         return -1;
      }
      
      public static function _0pu(param1:int, param2:Player) : Boolean
      {
         var _loc5_:int = 0;
         if(param2 == null)
         {
            return true;
         }
         var _loc3_:XML = XmlData[param1];
         if(_loc3_ == null || !_loc3_.hasOwnProperty("SlotType"))
         {
            return false;
         }
         var _loc4_:int = _loc3_.SlotType;
         if(_loc4_ == _0P_M_._E_I_ || _loc4_ == _0P_M_._w5)
         {
            return true;
         }
         while(_loc5_ < param2._01e.length)
         {
            if(param2._01e[_loc5_] == _loc4_)
            {
               return true;
            }
            _loc5_++;
         }
         return false;
      }
      
      public static function _0N_6(param1:int) : Boolean
      {
         var _loc2_:XML = XmlData[param1];
         return _loc2_ != null && _loc2_.hasOwnProperty("Soulbound");
      }
      
      public static function usableBy(param1:int) : Vector.<String>
      {
         var _loc2_:XML = null;
         var _loc3_:Vector.<int> = null;
         var _loc4_:int = 0;
         var _loc5_:XML = XmlData[param1];
         if(_loc5_ == null || !_loc5_.hasOwnProperty("SlotType"))
         {
            return null;
         }
         var _loc6_:int = _loc5_.SlotType;
         if(_loc6_ == _0P_M_._E_I_ || _loc6_ == _0P_M_._0D_w || _loc6_ == _0P_M_._w5)
         {
            return null;
         }
         var _loc7_:Vector.<String> = new Vector.<String>();
         for each(_loc2_ in _1bS_)
         {
            _loc3_ = ConversionUtil._1b5(_loc2_.SlotTypes);
            _loc4_ = 0;
            while(_loc4_ < _loc3_.length)
            {
               if(_loc3_[_loc4_] == _loc6_)
               {
                  _loc7_.push(_O_S_[int(_loc2_.@type)]);
                  break;
               }
               _loc4_++;
            }
         }
         return _loc7_;
      }
      
      public static function _yc(param1:int, param2:Player) : Boolean
      {
         var _loc3_:XML = null;
         if(param2 == null)
         {
            return true;
         }
         var _loc4_:XML = XmlData[param1];
         for each(_loc3_ in _loc4_.EquipRequirement)
         {
            if(!_0P_Z_(_loc3_,param2))
            {
               return false;
            }
         }
         return true;
      }
      
      public static function _0P_Z_(param1:XML, param2:Player) : Boolean
      {
         var _loc3_:int = 0;
         if(param1.toString() == "Stat")
         {
            _loc3_ = int(param1.@value);
            switch(int(param1.@stat))
            {
               case StatData.MAXHP:
                  return param2.maxHp_ >= _loc3_;
               case StatData.MAXMP:
                  return param2.maxMp_ >= _loc3_;
               case StatData.LEVEL:
                  return param2.level_ >= _loc3_;
               case StatData.ATTACK:
                  return param2.attack_ >= _loc3_;
               case StatData.DEFENSE:
                  return param2.defense_ >= _loc3_;
               case StatData.SPEED:
                  return param2.speed_ >= _loc3_;
               case StatData.VITALITY:
                  return param2.vitality_ >= _loc3_;
               case StatData.WISDOM:
                  return param2.wisdom_ >= _loc3_;
               case StatData.DEXTERITY:
                  return param2.dexterity_ >= _loc3_;
            }
         }
         return false;
      }
      
      public static function _0W_A_(param1:int) : XML
      {
         return _jf[param1];
      }
   }
}
