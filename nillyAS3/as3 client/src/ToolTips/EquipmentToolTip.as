package ToolTips
{
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui._0fL_;
   import com.company.assembleegameclient.objects.Player;
   import _1xa.SText;
   import flash.filters.DropShadowFilter;
   import _1xa.AppendingLineBuilder;
   import _C_._1O_I_;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import flash.display.BitmapData;
   import com.company.util.BitmapUtil;
   import _1xa._dU_;
   import _7m.StatData;
   import _1pm.ActivateEffect;
   import _0qE_._016;
   import _1xa._1eo;
   import com.company.util.Keys;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class EquipmentToolTip extends ToolTip
   {
      
      private static const _0H_p:int = 230;
       
      
      private var icon:Bitmap;
      
      public var _1N_S_:SimpleText;
      
      private var _1E_L_:SimpleText;
      
      private var _02R_:SimpleText;
      
      private var line1:_0fL_;
      
      private var _177:SimpleText;
      
      private var line2:_0fL_;
      
      private var _0U_S_:SimpleText;
      
      private var player:Player;
      
      private var _0nU_:Boolean = false;
      
      private var objectType:int;
      
      private var curItemXML:XML = null;
      
      private var _0__h:XML = null;
      
      private var _0I_u:ToolTips._tk;
      
      private var _6u:Vector.<Restriction>;
      
      private var _N_L_:Vector.<Effect>;
      
      private var _0P_D_:Vector.<Effect>;
      
      private var _D_G_:int;
      
      private var _1G_r:int;
      
      private var _v7:uint;
      
      private var _02s:String;
      
      private var _1H_9:Boolean;
      
      private var _14f:Boolean;
      
      private var _M_C_:ToolTips._hT_;
      
      private var _1lI_:SimpleText;
      
      public function EquipmentToolTip(param1:int, param2:Player, param3:int, param4:String)
      {
         this._0P_D_ = new Vector.<Effect>();
         this.objectType = param1;
         this.player = param2;
         this._1G_r = param3;
         this._02s = param4;
         this._1H_9 = !!param2?Boolean(param2._1H_9()):false;
         this._14f = !!param2?Boolean(ObjectLibrary._0pu(param1,param2)):false;
         var _loc5_:int = !!param2?int(ObjectLibrary._bc(param1,param2)):-1;
         var _loc6_:uint = this._14f || this.player == null?uint(3552822):uint(6036765);
         var _loc7_:uint = this._14f || param2 == null?uint(10197915):uint(10965039);
         super(_loc6_,1,_loc7_,1,true);
         this._0I_u = new ToolTips._tk();
         this._0__h = ObjectLibrary.XmlData[param1];
         this._0nU_ = _loc5_ != -1;
         this._N_L_ = new Vector.<Effect>();
         this._D_G_ = int(this._0__h.SlotType);
         if(this.player == null)
         {
            this.curItemXML = this._0__h;
         }
         else if(this._0nU_)
         {
            if(this.player.inventory_[_loc5_] != -1)
            {
               this.curItemXML = ObjectLibrary.XmlData[this.player.inventory_[_loc5_]];
            }
         }
         this._0M_R_();
         this._15Z_();
         this._0O_L_();
         this._9W_();
         this._0X_l();
         this._0tM_();
         this._V_7();
         this._Z_p();
         this._48();
         this._1dr();
         this._0N_k();
         this._1P_J_();
         this._1rO_();
         this._0S_i();
         this._1S_h();
         this._17h();
         this._1n1();
         this._1A_F_();
         this._1T_x();
      }
      
      private function _1T_x() : void
      {
         var _loc1_:int = 0;
         if(this._0__h.hasOwnProperty("feedPower"))
         {
            _loc1_ = this._14f || this.player == null?16777215:16549442;
            this._1lI_ = new SimpleText().setSize(12).setColor(_loc1_).setBold(true).setTextWidth(_0H_p - this.icon.width - 4 - 30).setWordWrap(true);
            this._1lI_.setStringBuilder(new SText().setString("Feed Power: " + this._0__h.feedPower));
            this._1lI_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
            _01T_.push(this._1lI_.textChanged);
            addChild(this._1lI_);
         }
      }
      
      private function _V_7() : void
      {
         var _loc1_:XMLList = null;
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:AppendingLineBuilder = null;
         if(this._0__h.hasOwnProperty("ExtraTooltipData"))
         {
            _loc1_ = this._0__h.ExtraTooltipData.EffectInfo;
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = _loc2_.attribute("name");
               _loc4_ = _loc2_.attribute("description");
               _loc5_ = _loc3_ && _loc4_?": ":"\n";
               _loc6_ = new AppendingLineBuilder();
               if(_loc3_)
               {
                  _loc6_.pushParams(_loc3_);
               }
               if(_loc4_)
               {
                  _loc6_.pushParams(_loc4_,{},_1l1._07l(16777103),_1l1._1S_Z_());
               }
               _loc6_.setDelimiter(_loc5_);
               this._0P_D_.push(new Effect(_1O_I_._1N_q,{"data":_loc6_}));
            }
         }
      }
      
      private function _06J_() : Boolean
      {
         return this._0nU_ && this.curItemXML == null;
      }
      
      private function _0M_R_() : void
      {
         var _loc1_:XML = ObjectLibrary.XmlData[this.objectType];
         var _loc2_:int = 5;
         if(this.objectType == 4874 || this.objectType == 4618)
         {
            _loc2_ = 8;
         }
         if(_loc1_.hasOwnProperty("ScaleValue"))
         {
            _loc2_ = _loc1_.ScaleValue;
         }
         var _loc3_:BitmapData = ObjectLibrary.getRedrawnTextureFromType(this.objectType,60,true,true,_loc2_);
         _loc3_ = BitmapUtil._0P_V_(_loc3_,4,4,_loc3_.width - 8,_loc3_.height - 8);
         this.icon = new Bitmap(_loc3_);
         addChild(this.icon);
      }
      
      private function _0O_L_() : void
      {
         var _loc1_:* = this._0N_E_() == false;
         var _loc2_:* = this._0__h.hasOwnProperty("Consumable") == false;
         var _loc3_:* = this._0__h.hasOwnProperty("Treasure") == false;
         var _loc4_:Boolean = this._0__h.hasOwnProperty("Tier");
         if(_loc1_ && _loc2_ && _loc3_)
         {
            this._1E_L_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(30).setBold(true);
            if(_loc4_)
            {
               this._1E_L_.setStringBuilder(new _dU_().setParams(_1O_I_._0M_2,{"tier":this._0__h.Tier}));
            }
            else if(this._0__h.hasOwnProperty("@setType"))
            {
               this._1E_L_.setColor(16750848);
               this._1E_L_.setStringBuilder(new SText("ST"));
            }
            else
            {
               this._1E_L_.setColor(9055202);
               this._1E_L_.setStringBuilder(new _dU_().setParams(_1O_I_._0lL_));
            }
            addChild(this._1E_L_);
         }
      }
      
      private function _0N_E_() : Boolean
      {
         var activateTags:XMLList = null;
         activateTags = this._0__h.Activate.(text() == "PermaPet");
         return activateTags.length() >= 1;
      }
      
      private function _15Z_() : void
      {
         var _loc1_:int = this._14f || this.player == null?16777215:16549442;
         this._1N_S_ = new SimpleText().setSize(16).setColor(_loc1_).setBold(true).setTextWidth(_0H_p - this.icon.width - 4 - 30).setWordWrap(true);
         this._1N_S_.setStringBuilder(new _dU_().setParams(ObjectLibrary._O_S_[this.objectType]));
         this._1N_S_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         _01T_.push(this._1N_S_.textChanged);
         addChild(this._1N_S_);
      }
      
      private function _0Z_W_() : String
      {
         var _loc1_:XMLList = null;
         var _loc2_:Vector.<Effect> = null;
         var _loc3_:XML = null;
         if(this._0__h.hasOwnProperty("ExtraTooltipData"))
         {
            _loc1_ = this._0__h.ExtraTooltipData.EffectInfo;
            _loc2_ = new Vector.<Effect>();
            for each(_loc3_ in _loc1_)
            {
               _loc2_.push(new Effect(_loc3_.attribute("name"),_loc3_.attribute("description")));
            }
         }
         return "";
      }
      
      private function _1S_h() : void
      {
         var _loc1_:AppendingLineBuilder = null;
         if(this._N_L_.length != 0 || this._M_C_._10T_ != null || this._0__h.hasOwnProperty("ExtraTooltipData"))
         {
            this.line1 = new _0fL_(_0H_p - 12,0);
            this._177 = new SimpleText().setSize(14).setColor(11776947).setTextWidth(_0H_p).setWordWrap(true).setHTML(true);
            _loc1_ = this._0__Q_();
            this._177.setStringBuilder(_loc1_);
            this._177.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
            if(_loc1_._0tR_())
            {
               addChild(this.line1);
               addChild(this._177);
            }
         }
      }
      
      private function _0__Q_() : AppendingLineBuilder
      {
         var _loc1_:AppendingLineBuilder = new AppendingLineBuilder();
         this._I_v(this._0P_D_,_loc1_);
         if(this._M_C_._10T_._0tR_())
         {
            _loc1_.pushParams(_1O_I_._1N_q,{"data":this._M_C_._10T_});
         }
         this._I_v(this._N_L_,_loc1_);
         return _loc1_;
      }
      
      private function _I_v(param1:Vector.<Effect>, param2:AppendingLineBuilder) : void
      {
         var _loc3_:Effect = null;
         var _loc4_:* = null;
         var _loc5_:String = null;
         for each(_loc3_ in param1)
         {
            _loc4_ = "";
            _loc5_ = "";
            if(_loc3_.color_)
            {
               _loc4_ = "<font color=\"#" + _loc3_.color_.toString(16) + "\">";
               _loc5_ = "</font>";
            }
            param2.pushParams(_loc3_.name_,_loc3_.getValueReplacementsWithColor(),_loc4_,_loc5_);
         }
      }
      
      private function _Z_p() : void
      {
         if(this._0__h.hasOwnProperty("NumProjectiles") && this._M_C_._1U_C_.hasOwnProperty(this._0__h.NumProjectiles.toXMLString()) != true)
         {
            this._N_L_.push(new Effect(_1O_I_._1z9,{"numShots":this._0__h.NumProjectiles}));
         }
      }
      
      private function _0S_i() : void
      {
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         if(this._0__h.hasOwnProperty("FameBonus"))
         {
            _loc1_ = int(this._0__h.FameBonus);
            _loc2_ = !!this._14f?uint(_1l1._0pA_):uint(_1l1._Q_q);
            if(this.curItemXML != null && this.curItemXML.hasOwnProperty("FameBonus"))
            {
               _loc3_ = int(this.curItemXML.FameBonus.text());
               _loc2_ = _1l1._0dK_(_loc1_ - _loc3_);
            }
            this._N_L_.push(new Effect(_1O_I_._1W_P_,{"percent":this._0__h.FameBonus + "%"}).setReplacementsColor(_loc2_));
         }
      }
      
      private function _1rO_() : void
      {
         if(this._0__h.hasOwnProperty("MpEndCost"))
         {
            if(!this._M_C_._1U_C_[this._0__h.MpEndCost[0].toXMLString()])
            {
               this._N_L_.push(new Effect(_1O_I_._01J_,{"cost":this._0__h.MpEndCost}));
            }
         }
         else if(this._0__h.hasOwnProperty("MpCost") && !this._M_C_._1U_C_[this._0__h.MpCost[0].toXMLString()])
         {
            if(!this._M_C_._1U_C_[this._0__h.MpCost[0].toXMLString()])
            {
               this._N_L_.push(new Effect(_1O_I_._01J_,{"cost":this._0__h.MpCost}));
            }
         }
      }
      
      private function _1P_J_() : void
      {
         if(this._0__h.hasOwnProperty("Doses"))
         {
            this._N_L_.push(new Effect(_1O_I_._1U_,{"dose":this._0__h.Doses}));
         }
      }
      
      private function _48() : void
      {
         var _loc1_:XML = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:XML = null;
         if(this._0__h.hasOwnProperty("Projectile") && !this._M_C_._1U_C_.hasOwnProperty(this._0__h.Projectile.toXMLString()))
         {
            _loc1_ = XML(this._0__h.Projectile);
            _loc2_ = int(_loc1_.MinDamage);
            _loc3_ = int(_loc1_.MaxDamage);
            this._N_L_.push(new Effect(_1O_I_.DAMAGE,{"damage":(_loc2_ == _loc3_?_loc2_:_loc2_ + " - " + _loc3_).toString()}));
            _loc4_ = Number(_loc1_.Speed) * Number(_loc1_.LifetimeMS) / 10000;
            this._N_L_.push(new Effect(_1O_I_._04y,{"range":_1l1._0me(_loc4_)}));
            if(this._0__h.Projectile.hasOwnProperty("MultiHit"))
            {
               this._N_L_.push(new Effect(_1O_I_._1l2,{}).setColor(_1l1._Q_q));
            }
            if(this._0__h.Projectile.hasOwnProperty("PassesCover"))
            {
               this._N_L_.push(new Effect(_1O_I_._1O_e,{}).setColor(_1l1._Q_q));
            }
            if(this._0__h.Projectile.hasOwnProperty("ArmorPiercing"))
            {
               this._N_L_.push(new Effect(_1O_I_._1O_d,{}).setColor(_1l1._Q_q));
            }
            for each(_loc5_ in _loc1_.ConditionEffect)
            {
               if(this._M_C_._1U_C_[_loc5_.toXMLString()] == null)
               {
                  this._N_L_.push(new Effect(_1O_I_._19C_,{"effect":""}));
                  this._N_L_.push(new Effect(_1O_I_._13N_,{
                     "effect":this._0__h.Projectile.ConditionEffect,
                     "duration":this._0__h.Projectile.ConditionEffect.@duration
                  }).setColor(_1l1._Q_q));
               }
            }
         }
      }
      
      private function _1dr() : void
      {
         var _loc1_:XML = null;
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:String = null;
         var _loc7_:Object = null;
         var _loc8_:String = null;
         var _loc9_:uint = 0;
         var _loc10_:XML = null;
         var _loc11_:Object = null;
         var _loc12_:String = null;
         var _loc13_:uint = 0;
         var _loc14_:XML = null;
         var _loc15_:String = null;
         var _loc16_:Object = null;
         var _loc17_:String = null;
         var _loc18_:Object = null;
         var _loc19_:Number = NaN;
         var _loc20_:Number = NaN;
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:Number = NaN;
         var _loc24_:Number = NaN;
         var _loc25_:Number = NaN;
         var _loc26_:Number = NaN;
         var _loc27_:Number = NaN;
         var _loc28_:Number = NaN;
         var _loc29_:Number = NaN;
         var _loc30_:Number = NaN;
         var _loc31_:AppendingLineBuilder = null;
         for each(_loc1_ in this._0__h.Activate)
         {
            _loc5_ = this._M_C_._1U_C_[_loc1_.toXMLString()];
            if(this._M_C_._1U_C_[_loc1_.toXMLString()] != true)
            {
               _loc6_ = _loc1_.toString();
               switch(_loc6_)
               {
                  case ActivateEffect.CONDITIONEFFECTAURA:
                     this._N_L_.push(new Effect(_1O_I_._0A_I_,{"effect":new AppendingLineBuilder().pushParams(_1O_I_._1hR_,{"range":_loc1_.@range},_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     this._N_L_.push(new Effect(_1O_I_._13N_,{
                        "effect":_loc1_.@effect,
                        "duration":_loc1_.@duration
                     }).setColor(_1l1._Q_q));
                     continue;
                  case ActivateEffect.CONDITIONEFFECTSELF:
                     this._N_L_.push(new Effect(_1O_I_._1N_G_,{"effect":""}));
                     this._N_L_.push(new Effect(_1O_I_._13N_,{
                        "effect":_loc1_.@effect,
                        "duration":_loc1_.@duration
                     }));
                     continue;
                  case ActivateEffect.HEAL:
                     this._N_L_.push(new Effect(_1O_I_._M_l,{
                        "statAmount":"+" + _loc1_.@amount + " ",
                        "statName":new _dU_().setParams(_1O_I_._0t9)
                     }));
                     continue;
                  case ActivateEffect.HEALNOVA:
                     this._N_L_.push(new Effect(_1O_I_._F_h,{"effect":new AppendingLineBuilder().pushParams(_1O_I_._1__F_,{
                        "amount":_loc1_.@amount,
                        "range":_loc1_.@range
                     },_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.MAGIC:
                     this._N_L_.push(new Effect(_1O_I_._M_l,{
                        "statAmount":"+" + _loc1_.@amount + " ",
                        "statName":new _dU_().setParams(_1O_I_._F_u)
                     }));
                     continue;
                  case ActivateEffect.MAGICNOVA:
                     this._N_L_.push(new Effect(_1O_I_._1fO_,_loc1_.@amount + " MP at " + _loc1_.@range + " sqrs"));
                     continue;
                  case ActivateEffect.TELEPORT:
                     this._N_L_.push(new Effect(_1O_I_._1N_q,{"data":new _dU_().setParams(_1O_I_._0vd)}));
                     continue;
                  case ActivateEffect.VAMPIREBLAST:
                     this._N_L_.push(new Effect(_1O_I_._0ao,{"effect":new AppendingLineBuilder().pushParams(_1O_I_._1__F_,{
                        "amount":_loc1_.@totalDamage,
                        "range":_loc1_.@radius
                     },_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.TRAP:
                     _loc7_ = !!_loc1_.hasOwnProperty("@condEffect")?_loc1_.@condEffect:new _dU_().setParams(_1O_I_._1J_f);
                     _loc8_ = !!_loc1_.hasOwnProperty("@condDuration")?_loc1_.@condDuration:"5";
                     this._N_L_.push(new Effect(_1O_I_._0j9,{"data":new AppendingLineBuilder().pushParams(_1O_I_._1__F_,{
                        "amount":_loc1_.@totalDamage,
                        "range":_loc1_.@radius
                     },_1l1._07l(_1l1._Q_q),_1l1._1S_Z_()).pushParams(_1O_I_._13N_,{
                        "effect":_loc7_,
                        "duration":_loc8_
                     },_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.STASISBLAST:
                     this._N_L_.push(new Effect(_1O_I_._0B_h,{"stasis":new AppendingLineBuilder().pushParams(_1O_I_._1rK_,{"duration":_loc1_.@duration},_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.DECOY:
                     this._N_L_.push(new Effect(_1O_I_._2__,{"data":new AppendingLineBuilder().pushParams(_1O_I_._1rK_,{"duration":_loc1_.@duration},_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.LIGHTNING:
                     this._N_L_.push(new Effect(_1O_I_._1W_J_,{"data":new AppendingLineBuilder().pushParams(_1O_I_._I_s,{
                        "damage":_loc1_.@totalDamage,
                        "targets":_loc1_.@maxTargets
                     },_1l1._07l(_1l1._Q_q),_1l1._1S_Z_())}));
                     continue;
                  case ActivateEffect.POISONGRENADE:
                     this._N_L_.push(new Effect(_1O_I_._0L_a,{"data":""}));
                     this._N_L_.push(new Effect(_1O_I_._tl,{
                        "damage":_loc1_.@totalDamage,
                        "duration":_loc1_.@duration,
                        "radius":_loc1_.@radius
                     }).setColor(_1l1._Q_q));
                     continue;
                  case ActivateEffect.REMOVENEGATIVECONDITIONS:
                     this._N_L_.push(new Effect(_1O_I_._0z9,{}).setColor(_1l1._Q_q));
                     continue;
                  case ActivateEffect.REMOVENEGATIVECONDITIONSELF:
                     this._N_L_.push(new Effect(_1O_I_._0z9,{}).setColor(_1l1._Q_q));
                     continue;
                  case ActivateEffect.GENERICACTIVATE:
                     _loc9_ = 16777103;
                     if(this.curItemXML != null)
                     {
                        _loc10_ = this._0pJ_(this.curItemXML,_loc1_.@effect);
                        if(_loc10_ != null)
                        {
                           _loc19_ = Number(_loc1_.@range);
                           _loc20_ = Number(_loc10_.@range);
                           _loc21_ = Number(_loc1_.@duration);
                           _loc22_ = Number(_loc10_.@duration);
                           _loc23_ = _loc19_ - _loc20_ + (_loc21_ - _loc22_);
                           if(_loc23_ > 0)
                           {
                              _loc9_ = 65280;
                           }
                           else if(_loc23_ < 0)
                           {
                              _loc9_ = 16711680;
                           }
                        }
                     }
                     _loc11_ = {
                        "range":_loc1_.@range,
                        "effect":_loc1_.@effect,
                        "duration":_loc1_.@duration
                     };
                     _loc12_ = "Within {range} sqrs {effect} for {duration} seconds";
                     this._N_L_.push(new Effect(_1O_I_._0A_I_,{"effect":_dU_._T_V_(_loc12_,_loc11_)}).setReplacementsColor(_loc9_));
                     continue;
                  case ActivateEffect.STATBOOSTAURA:
                     _loc13_ = 16777103;
                     if(this.curItemXML != null)
                     {
                        _loc14_ = this._0ft(this.curItemXML,_loc1_.@stat);
                        if(_loc14_ != null)
                        {
                           _loc24_ = Number(_loc1_.@range);
                           _loc25_ = Number(_loc14_.@range);
                           _loc26_ = Number(_loc1_.@duration);
                           _loc27_ = Number(_loc14_.@duration);
                           _loc28_ = Number(_loc1_.@amount);
                           _loc29_ = Number(_loc14_.@amount);
                           _loc30_ = _loc24_ - _loc25_ + (_loc26_ - _loc27_) + (_loc28_ - _loc29_);
                           if(_loc30_ > 0)
                           {
                              _loc13_ = 65280;
                           }
                           else if(_loc30_ < 0)
                           {
                              _loc13_ = 16711680;
                           }
                        }
                     }
                     _loc3_ = int(_loc1_.@stat);
                     _loc15_ = _dU_._ss(StatData._N_v(_loc3_));
                     _loc16_ = {
                        "range":_loc1_.@range,
                        "stat":_loc15_,
                        "amount":_loc1_.@amount,
                        "duration":_loc1_.@duration
                     };
                     _loc17_ = "Within {range} sqrs increase {stat} by {amount} for {duration} seconds";
                     this._N_L_.push(new Effect(_1O_I_._0A_I_,{"effect":_dU_._T_V_(_loc17_,_loc16_)}).setReplacementsColor(_loc13_));
                     continue;
                  case ActivateEffect.INCREMENTSTAT:
                     _loc3_ = int(_loc1_.@stat);
                     _loc4_ = int(_loc1_.@amount);
                     _loc18_ = {};
                     if(_loc3_ != StatData.HP && _loc3_ != StatData.MP && _loc3_ != StatData.DAMAGEMIN && _loc3_ != StatData.DAMAGEMAX)
                     {
                        _loc2_ = _1O_I_._1J_Y_;
                        _loc18_["statName"] = new _dU_().setParams(StatData._N_v(_loc3_));
                        this._N_L_.push(new Effect(_loc2_,_loc18_).setColor(16777103));
                     }
                     else
                     {
                        _loc2_ = _1O_I_._1N_q;
                        _loc31_ = new AppendingLineBuilder().setDelimiter(" ");
                        _loc31_.pushParams(_1O_I_._1N_q,{"data":new SText("+" + _loc4_)});
                        _loc31_.pushParams(StatData._N_v(_loc3_));
                        _loc18_["data"] = _loc31_;
                        this._N_L_.push(new Effect(_loc2_,_loc18_));
                     }
                     continue;
                  default:
                     continue;
               }
            }
            else
            {
               continue;
            }
         }
      }
      
      private function _0pJ_(param1:XML, param2:String) : XML
      {
         var matches:XMLList = null;
         var tag:XML = null;
         var xml:XML = param1;
         var effectValue:String = param2;
         matches = xml.Activate.(text() == ActivateEffect.GENERICACTIVATE);
         for each(tag in matches)
         {
            if(tag.@effect == effectValue)
            {
               return tag;
            }
         }
         return null;
      }
      
      private function _0ft(param1:XML, param2:String) : XML
      {
         var matches:XMLList = null;
         var tag:XML = null;
         var xml:XML = param1;
         var statValue:String = param2;
         matches = xml.Activate.(text() == ActivateEffect.STATBOOSTAURA);
         for each(tag in matches)
         {
            if(tag.@stat == statValue)
            {
               return tag;
            }
         }
         return null;
      }
      
      private function _0N_k() : void
      {
         var _loc1_:XML = null;
         var _loc2_:Boolean = true;
         for each(_loc1_ in this._0__h.ActivateOnEquip)
         {
            if(_loc2_)
            {
               this._N_L_.push(new Effect(_1O_I_._17a,""));
               _loc2_ = false;
            }
            if(_loc1_.toString() == "IncrementStat")
            {
               this._N_L_.push(new Effect(_1O_I_._M_l,this._1G_J_(_loc1_)).setReplacementsColor(this._6h(_loc1_)));
            }
         }
      }
      
      private function _1G_J_(param1:XML) : Object
      {
         var _loc2_:int = int(param1.@stat);
         var _loc3_:int = int(param1.@amount);
         var _loc4_:String = _loc3_ > -1?"+":"";
         return {
            "statAmount":_loc4_ + String(_loc3_) + " ",
            "statName":new _dU_().setParams(StatData._N_v(_loc2_))
         };
      }
      
      private function _6h(param1:XML) : uint
      {
         var match:XML = null;
         var otherAmount:int = 0;
         var otherMatches:XMLList = null;
         var activateXML:XML = param1;
         var stat:int = int(activateXML.@stat);
         var amount:int = int(activateXML.@amount);
         var textColor:uint = !!this._14f?uint(_1l1._0pA_):uint(_1l1._Q_q);
         if(this.curItemXML != null)
         {
            otherMatches = this.curItemXML.ActivateOnEquip.(@stat == stat);
         }
         if(otherMatches != null && otherMatches.length() == 1)
         {
            match = XML(otherMatches[0]);
            otherAmount = int(match.@amount);
            textColor = _1l1._0dK_(amount - otherAmount);
         }
         if(amount < 0)
         {
            textColor = 16711680;
         }
         return textColor;
      }
      
      private function _cv() : void
      {
         if(this._0__h.hasOwnProperty("Treasure") == false)
         {
            this._6u.push(new Restriction(_1O_I_._1__3,11776947,false));
            if(this._1H_9 || this._02s == _016.CURRENT_PLAYER)
            {
               this._6u.push(new Restriction(_1O_I_._1O_v,11776947,false));
            }
            else
            {
               this._6u.push(new Restriction(_1O_I_._0yR_,11776947,false));
            }
         }
      }
      
      private function _1R_r() : void
      {
         this._6u.push(new Restriction(_1O_I_._1W_M_,16777215,false));
      }
      
      private function _15d() : void
      {
         this._6u.push(new Restriction(_1O_I_._0O_f,11776947,false));
         if(this._1H_9 || this._02s == _016.CURRENT_PLAYER)
         {
            this._6u.push(new Restriction(_1O_I_._0jh,16777215,false));
         }
         else
         {
            this._6u.push(new Restriction(_1O_I_._1E_N_,16777215,false));
         }
      }
      
      private function _1M_F_() : void
      {
         this._6u.push(new Restriction(_1O_I_._1P_8,11776947,false));
         this._6u.push(new Restriction(_1O_I_._0jh,16777215,false));
      }
      
      private function _1n1() : void
      {
         var _loc1_:XML = null;
         var _loc2_:Boolean = false;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         this._6u = new Vector.<Restriction>();
         if(this._0__h.hasOwnProperty("VaultItem") && this._1G_r != -1 && this._1G_r != ObjectLibrary._07h["Vault Chest"])
         {
            this._6u.push(new Restriction(_1O_I_._9C_,16549442,true));
         }
         if(this._0__h.hasOwnProperty("Soulbound"))
         {
            this._6u.push(new Restriction(_1O_I_._I_l,11776947,false));
         }
         if(this._14f)
         {
            if(this._0__h.hasOwnProperty("Usable"))
            {
               this._1R_r();
               this._cv();
            }
            else if(this._0__h.hasOwnProperty("Consumable"))
            {
               this._15d();
            }
            else if(this._0__h.hasOwnProperty("InvUse"))
            {
               this._1M_F_();
            }
            else
            {
               this._cv();
            }
         }
         else if(this.player != null)
         {
            this._6u.push(new Restriction(_1O_I_._0uT_,16549442,true));
         }
         var _loc5_:Vector.<String> = ObjectLibrary.usableBy(this.objectType);
         if(_loc5_ != null)
         {
            this._6u.push(new Restriction(_1O_I_._0K_f,11776947,false));
         }
         for each(_loc1_ in this._0__h.EquipRequirement)
         {
            _loc2_ = ObjectLibrary._0P_Z_(_loc1_,this.player);
            if(_loc1_.toString() == "Stat")
            {
               _loc3_ = int(_loc1_.@stat);
               _loc4_ = int(_loc1_.@value);
               this._6u.push(new Restriction("Requires " + StatData._N_v(_loc3_) + " of " + _loc4_,!!_loc2_?uint(11776947):uint(16549442),!!_loc2_?false:true));
            }
         }
      }
      
      private function _17h() : void
      {
         this.line2 = new _0fL_(_0H_p - 12,0);
         addChild(this.line2);
      }
      
      private function _1A_F_() : void
      {
         if(this._6u.length != 0)
         {
            this._0U_S_ = new SimpleText().setSize(14).setColor(11776947).setTextWidth(_0H_p - 4).setIndent(-10).setLeftMargin(10).setWordWrap(true).setHTML(true);
            this._0U_S_.setStringBuilder(this._0B_S_());
            this._0U_S_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
            _01T_.push(this._0U_S_.textChanged);
            addChild(this._0U_S_);
         }
      }
      
      private function _0B_S_() : _1eo
      {
         var _loc1_:Restriction = null;
         var _loc2_:String = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:AppendingLineBuilder = new AppendingLineBuilder();
         for each(_loc1_ in this._6u)
         {
            _loc2_ = !!_loc1_.bold_?"<b>":"";
            _loc2_ = _loc2_.concat("<font color=\"#" + _loc1_.color_.toString(16) + "\">");
            _loc3_ = "</font>";
            _loc3_ = _loc3_.concat(!!_loc1_.bold_?"</b>":"");
            _loc4_ = !!this.player?ObjectLibrary._O_S_[this.player.objectType_]:"";
            _loc5_.pushParams(_loc1_.text_,{
               "unUsableClass":_loc4_,
               "usableClasses":this._oL_(),
               "keyCode":Keys._0L_[Parameters.data_.useSpecial]
            },_loc2_,_loc3_);
         }
         return _loc5_;
      }
      
      private function _oL_() : _1eo
      {
         var _loc1_:String = null;
         var _loc2_:Vector.<String> = ObjectLibrary.usableBy(this.objectType);
         var _loc3_:AppendingLineBuilder = new AppendingLineBuilder();
         _loc3_.setDelimiter(", ");
         for each(_loc1_ in _loc2_)
         {
            _loc3_.pushParams(_loc1_);
         }
         return _loc3_;
      }
      
      private function _9W_() : void
      {
         this._02R_ = new SimpleText().setSize(14).setColor(11776947).setTextWidth(_0H_p).setWordWrap(true);
         this._02R_.setStringBuilder(new _dU_().setParams(String(this._0__h.Description)));
         this._02R_.filters = [new DropShadowFilter(0,0,0,0.5,12,12)];
         _01T_.push(this._02R_.textChanged);
         addChild(this._02R_);
      }
      
      override protected function alignUI() : void
      {
         this._1N_S_.x = this.icon.width + 4;
         this._1N_S_.y = this.icon.height / 2 - this._1N_S_.height / 2;
         if(this._1E_L_)
         {
            this._1E_L_.y = this.icon.height / 2 - this._1E_L_.height / 2;
            this._1E_L_.x = _0H_p - 30;
         }
         this._02R_.x = 4;
         this._02R_.y = this.icon.height + 2;
         if(contains(this.line1))
         {
            this.line1.x = 8;
            this.line1.y = this._02R_.y + this._02R_.height + 8;
            this._177.x = 4;
            this._177.y = this.line1.y + 8;
         }
         else
         {
            this.line1.y = this._02R_.y + this._02R_.height;
            this._177.y = this.line1.y;
         }
         this.line2.x = 8;
         this.line2.y = this._177.y + this._177.height + 8;
         var _loc1_:uint = this.line2.y + 8;
         if(this._0U_S_)
         {
            this._0U_S_.x = 4;
            this._0U_S_.y = _loc1_;
            _loc1_ = _loc1_ + this._0U_S_.height;
         }
         if(this._1lI_)
         {
            if(contains(this._1lI_))
            {
               this._1lI_.x = 4;
               this._1lI_.y = _loc1_;
            }
         }
      }
      
      private function _0tM_() : void
      {
         if(this.curItemXML != null)
         {
            this._M_C_ = this._0I_u._tv(this._0__h,this.curItemXML);
         }
         else
         {
            this._M_C_ = new ToolTips._hT_();
         }
      }
      
      private function _0X_l() : void
      {
         var _loc1_:XML = null;
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:String = null;
         if(this.player == null)
         {
            return;
         }
         var _loc5_:Number = this.player.wisdom_ + this.player.wisdomBonus_;
         if(_loc5_ < 30)
         {
            return;
         }
         var _loc6_:Vector.<XML> = new Vector.<XML>();
         if(this.curItemXML != null)
         {
            this.curItemXML = this.curItemXML.copy();
            _loc6_.push(this.curItemXML);
         }
         if(this._0__h != null)
         {
            this._0__h = this._0__h.copy();
            _loc6_.push(this._0__h);
         }
         for each(_loc2_ in _loc6_)
         {
            for each(_loc1_ in _loc2_.Activate)
            {
               _loc3_ = _loc1_.toString();
               if(_loc1_.@effect != "Stasis")
               {
                  _loc4_ = _loc1_.@useWisMod;
                  if(!(_loc4_ == "" || _loc4_ == "false" || _loc4_ == "0" || _loc1_.@effect == "Stasis"))
                  {
                     switch(_loc3_)
                     {
                        case ActivateEffect.HEALNOVA:
                           _loc1_.@amount = this._1X_O_(_loc1_.@amount,0);
                           _loc1_.@range = this._1X_O_(_loc1_.@range);
                           continue;
                        case ActivateEffect.CONDITIONEFFECTAURA:
                           _loc1_.@duration = this._1X_O_(_loc1_.@duration);
                           _loc1_.@range = this._1X_O_(_loc1_.@range);
                           continue;
                        case ActivateEffect.CONDITIONEFFECTSELF:
                           _loc1_.@duration = this._1X_O_(_loc1_.@duration);
                           continue;
                        case ActivateEffect.STATBOOSTAURA:
                           _loc1_.@amount = this._1X_O_(_loc1_.@amount,0);
                           _loc1_.@duration = this._1X_O_(_loc1_.@duration);
                           _loc1_.@range = this._1X_O_(_loc1_.@range);
                           continue;
                        case ActivateEffect.GENERICACTIVATE:
                           _loc1_.@duration = this._1X_O_(_loc1_.@duration);
                           _loc1_.@range = this._1X_O_(_loc1_.@range);
                           continue;
                        default:
                           continue;
                     }
                  }
                  else
                  {
                     continue;
                  }
               }
               else
               {
                  continue;
               }
            }
         }
      }
      
      private function _1X_O_(param1:String, param2:Number = 1) : String
      {
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         var _loc5_:Number = NaN;
         var _loc6_:* = "-1";
         var _loc7_:Number = this.player.wisdom_ - this.player.wisdomBonus_;
         if(_loc7_ < 30)
         {
            _loc6_ = param1;
         }
         else
         {
            _loc3_ = Number(param1);
            _loc4_ = _loc3_ < 0?-1:1;
            _loc5_ = _loc3_ * _loc7_ / 150 + _loc3_ * _loc4_;
            _loc5_ = Math.floor(_loc5_ * Math.pow(10,param2)) / Math.pow(10,param2);
            if(_loc5_ - int(_loc5_) * _loc4_ >= 1 / Math.pow(10,param2) * _loc4_)
            {
               _loc6_ = _loc5_.toFixed(1);
            }
            else
            {
               _loc6_ = _loc5_.toFixed(0);
            }
         }
         return _loc6_;
      }
   }
}

import _1xa._dU_;
import _1xa.AppendingLineBuilder;

class Effect
{
    
   
   public var name_:String;
   
   public var valueReplacements_:Object;
   
   public var replacementColor_:uint = 16777103;
   
   public var color_:uint = 11776947;
   
   function Effect(param1:String, param2:Object)
   {
      super();
      this.name_ = param1;
      this.valueReplacements_ = param2;
   }
   
   public function setColor(param1:uint) : Effect
   {
      this.color_ = param1;
      return this;
   }
   
   public function setReplacementsColor(param1:uint) : Effect
   {
      this.replacementColor_ = param1;
      return this;
   }
   
   public function getValueReplacementsWithColor() : Object
   {
      var _loc1_:* = null;
      var _loc2_:_dU_ = null;
      var _loc3_:Object = {};
      var _loc4_:* = "";
      var _loc5_:* = "";
      if(this.replacementColor_)
      {
         _loc4_ = "</font><font color=\"#" + this.replacementColor_.toString(16) + "\">";
         _loc5_ = "</font><font color=\"#" + this.color_.toString(16) + "\">";
      }
      for(_loc1_ in this.valueReplacements_)
      {
         if(this.valueReplacements_[_loc1_] is AppendingLineBuilder)
         {
            _loc3_[_loc1_] = this.valueReplacements_[_loc1_];
         }
         else if(this.valueReplacements_[_loc1_] is _dU_)
         {
            _loc2_ = this.valueReplacements_[_loc1_] as _dU_;
            _loc2_.setPrefix(_loc4_).setPostfix(_loc5_);
            _loc3_[_loc1_] = _loc2_;
         }
         else
         {
            _loc3_[_loc1_] = _loc4_ + this.valueReplacements_[_loc1_] + _loc5_;
         }
      }
      return _loc3_;
   }
}

class Restriction
{
    
   
   public var text_:String;
   
   public var color_:uint;
   
   public var bold_:Boolean;
   
   function Restriction(param1:String, param2:uint, param3:Boolean)
   {
      super();
      this.text_ = param1;
      this.color_ = param2;
      this.bold_ = param3;
   }
}
