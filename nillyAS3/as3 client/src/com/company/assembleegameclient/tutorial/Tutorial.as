package com.company.assembleegameclient.tutorial
{
   import flash.display.Sprite;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.display.Shape;
   import flash.events.Event;
   import com.company.assembleegameclient.objects.Player;
   import com.company.assembleegameclient.objects.GameObject;
   import flash.utils.getTimer;
   import flash.filters.BlurFilter;
   import com.company.util.PointUtil;
   import flash.display.Graphics;
   import kabam.rotmg.assets.EmbeddedData;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class Tutorial extends Sprite
   {
      
      public static const _B_P_:String = "Next";
      
      public static const _0V_E_:String = "MoveForward";
      
      public static const _0a1:String = "MoveBackward";
      
      public static const _1y:String = "RotateLeft";
      
      public static const _1vg:String = "RotateRight";
      
      public static const _1np:String = "MoveLeft";
      
      public static const _19c:String = "MoveRight";
      
      public static const _ig:String = "Update";
      
      public static const _0ol:String = "Attack";
      
      public static const _ag:String = "Damage";
      
      public static const _T_O_:String = "Kill";
      
      public static const _1__s:String = "ShowLoot";
      
      public static const _0x9:String = "Text";
      
      public static const _1__k:String = "ShowPortal";
      
      public static const _1Y_i:String = "EnterPortal";
      
      public static const _1O_Q_:String = "Near";
      
      public static const _0iD_:String = "Equip";
       
      
      public var gs_:GameSprite;
      
      public var _0ia:Vector.<com.company.assembleegameclient.tutorial.Step>;
      
      public var _1aA_:int = 0;
      
      private var _1E_A_:Sprite;
      
      private var _U_w:Shape;
      
      private var _N_X_:Shape;
      
      private var _0B_a:com.company.assembleegameclient.tutorial._1zl = null;
      
      public function Tutorial(param1:GameSprite)
      {
         var _loc2_:XML = null;
         var _loc3_:Graphics = null;
         this._0ia = new Vector.<com.company.assembleegameclient.tutorial.Step>();
         this._1E_A_ = new Sprite();
         this._U_w = new Shape();
         this._N_X_ = new Shape();
         super();
         this.gs_ = param1;
         for each(_loc2_ in EmbeddedData.TutorialScript.Step)
         {
            this._0ia.push(new com.company.assembleegameclient.tutorial.Step(_loc2_));
         }
         addChild(this._U_w);
         addChild(this._N_X_);
         _loc3_ = this._1E_A_.graphics;
         _loc3_.clear();
         _loc3_.beginFill(0,0.1);
         _loc3_.drawRect(0,0,800,600);
         _loc3_.endFill();
         Parameters.data_.needsTutorial = false;
         Parameters.save();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         this.draw();
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:com.company.assembleegameclient.tutorial.Step = null;
         var _loc3_:Boolean = false;
         var _loc4_:Requirement = null;
         var _loc5_:int = 0;
         var _loc6_:UIDrawBox = null;
         var _loc7_:UIDrawArrow = null;
         var _loc8_:Player = null;
         var _loc9_:Boolean = false;
         var _loc10_:GameObject = null;
         var _loc11_:Number = NaN;
         var _loc13_:int = 0;
         var _loc12_:Number = Math.abs(Math.sin(getTimer() / 300));
         this._U_w.filters = [new BlurFilter(5 + _loc12_ * 5,5 + _loc12_ * 5)];
         this._N_X_.graphics.clear();
         this._U_w.graphics.clear();
         while(_loc13_ < this._0ia.length)
         {
            _loc2_ = this._0ia[_loc13_];
            _loc3_ = true;
            for each(_loc4_ in _loc2_._j)
            {
               _loc8_ = this.gs_.map.player_;
               switch(_loc4_.type_)
               {
                  case _1O_Q_:
                     _loc9_ = false;
                     for each(_loc10_ in this.gs_.map.goDict_)
                     {
                        if(!(_loc10_.objectType_ != _loc4_.objectType_ || _loc4_._g5 != "" && _loc10_.name_ != _loc4_._g5))
                        {
                           _loc11_ = PointUtil.getDistance(_loc10_.x_,_loc10_.y_,_loc8_.x_,_loc8_.y_);
                           if(_loc11_ <= _loc4_.radius_)
                           {
                              _loc9_ = true;
                              break;
                           }
                        }
                     }
                     if(!_loc9_)
                     {
                        _loc3_ = false;
                     }
                     continue;
                  default:
                     continue;
               }
            }
            if(!_loc3_)
            {
               _loc2_._1I_K_ = 0;
            }
            else
            {
               if(_loc2_._1I_K_ == 0)
               {
                  _loc2_._1I_K_ = getTimer();
               }
               _loc5_ = getTimer() - _loc2_._1I_K_;
               for each(_loc6_ in _loc2_._1H_G_)
               {
                  _loc6_.draw(5 * _loc12_,this._N_X_.graphics,_loc5_);
                  _loc6_.draw(6 * _loc12_,this._U_w.graphics,_loc5_);
               }
               for each(_loc7_ in _loc2_._1U_B_)
               {
                  _loc7_.draw(5 * _loc12_,this._N_X_.graphics,_loc5_);
                  _loc7_.draw(6 * _loc12_,this._U_w.graphics,_loc5_);
               }
            }
            _loc13_++;
         }
      }
      
      function doneAction(param1:String) : void
      {
         var _loc2_:Requirement = null;
         var _loc3_:Player = null;
         var _loc4_:Boolean = false;
         var _loc5_:GameObject = null;
         var _loc6_:Number = NaN;
         if(this._1aA_ >= this._0ia.length)
         {
            return;
         }
         var _loc7_:com.company.assembleegameclient.tutorial.Step = this._0ia[this._1aA_];
         if(param1 != _loc7_.action_)
         {
            return;
         }
         while(true)
         {
            loop0:
            for each(_loc2_ in _loc7_._j)
            {
               _loc3_ = this.gs_.map.player_;
               switch(_loc2_.type_)
               {
                  case _1O_Q_:
                     _loc4_ = false;
                     for each(_loc5_ in this.gs_.map.goDict_)
                     {
                        if(_loc5_.objectType_ == _loc2_.objectType_)
                        {
                           _loc6_ = PointUtil.getDistance(_loc5_.x_,_loc5_.y_,_loc3_.x_,_loc3_.y_);
                           if(_loc6_ <= _loc2_.radius_)
                           {
                              _loc4_ = true;
                              break;
                           }
                        }
                     }
                     if(!_loc4_)
                     {
                        break loop0;
                     }
                     continue;
                  case _0iD_:
                     if(_loc3_.inventory_[_loc2_._08g] != _loc2_.objectType_)
                     {
                        return;
                     }
                     continue;
                  default:
                     continue;
               }
            }
            var _loc8_:* = this;
            this._1aA_++;
            this.draw();
            return;
         }
      }
      
      private function draw() : void
      {
         var _loc1_:UIDrawBox = null;
      }
   }
}
