package _W_Q_
{
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.appengine._0Z_6;
   import _v4.Client;
   import flash.display.Bitmap;
   import _1gF_.SimpleText;
   import _T_n._1gJ_;
   import _1S_0._1mh;
   import _T_J_.GTween;
   import com.company.rotmg.graphics.FullCharBoxGraphic;
   import com.company.assembleegameclient.util._Z_4;
   import com.company.assembleegameclient.util.Star;
   import flash.filters.DropShadowFilter;
   import ToolTips.ToolTip;
   import ToolTips._yj;
   import com.company.assembleegameclient.appengine.SavedCharacter;
   import com.company.rotmg.graphics.StarGraphic;
   import _1xa._dU_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.util.Currency;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   import com.company.rotmg.graphics.LockedCharBoxGraphic;
   import com.company.util.TextureLibrary;
   
   public class CharacterBox extends Sprite
   {
      
      public static const DELETE_CHAR:String = "DELETE_CHAR";
      
      public static const ENTER_NAME:String = "ENTER_NAME";
      
      private static const _U_9:ColorTransform = new ColorTransform(0.8,0.8,0.8);
      
      private static const _9V_:ColorTransform = new ColorTransform(0.2,0.2,0.2);
       
      
      private var _1Y_U_:Class;
      
      public var playerXML_:XML = null;
      
      public var charStats_:_0Z_6;
      
      public var model:Client;
      
      public var _96:Boolean;
      
      private var _9K_:Sprite;
      
      private var _15y:Sprite;
      
      private var bitmap_:Bitmap;
      
      private var _ns:SimpleText;
      
      private var classNameText_:SimpleText;
      
      private var _1la:_1gJ_;
      
      private var cost:int = 0;
      
      private var _1bG_:Bitmap;
      
      private var _1qh:SimpleText;
      
      private var __else:SimpleText;
      
      private var _077;
      
      public var _11x:_1mh;
      
      public var _L_0:_1mh;
      
      public function CharacterBox(param1:XML, param2:_0Z_6, param3:Client, param4:Boolean = false)
      {
         var _loc5_:Sprite = null;
         this._1Y_U_ = _1tg;
         super();
         this.model = param3;
         this.playerXML_ = param1;
         this.charStats_ = param2;
         this._96 = param4 || param3._1G_H_(this.objectType());
         if(!this._96)
         {
            this._15y = new LockedCharBoxGraphic();
            this.cost = this.playerXML_.UnlockCost;
         }
         else
         {
            this._15y = new FullCharBoxGraphic();
         }
         this._9K_ = new Sprite();
         addChild(this._9K_);
         this._9K_.addChild(this._15y);
         this._L_0 = new _1mh(this._9K_,MouseEvent.CLICK,MouseEvent);
         this.bitmap_ = new Bitmap(null);
         this.setImage(_Z_4.DOWN,_Z_4._M_J_,0);
         this._15y.addChild(this.bitmap_);
         this.classNameText_ = new SimpleText().setSize(14).setColor(16777215).setAutoSize(TextFieldAutoSize.CENTER).setTextWidth(this._15y.width).setBold(true);
         this.classNameText_.setStringBuilder(new _dU_().setParams(this.playerXML_.DisplayId));
         this.classNameText_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this._15y.addChild(this.classNameText_);
         this._up();
         this._1pa();
         if(this._96)
         {
            _loc5_ = this._8R_(Star.numStars(param3._13t(this.objectType())),Star.ClassFameLevels.length);
            _loc5_.y = 60;
            _loc5_.x = this._15y.width / 2 - _loc5_.width / 2;
            _loc5_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
            this._9K_.addChild(_loc5_);
            this.classNameText_.y = 74;
         }
         else
         {
            addChild(this._1la);
            this._1bG_ = new Bitmap(TextureLibrary.getBitmap("lofiInterface2",5));
            this._1bG_.scaleX = 2;
            this._1bG_.scaleY = 2;
            this._1bG_.x = 4;
            this._1bG_.y = 8;
            addChild(this._1bG_);
            addChild(this._ns);
            this.classNameText_.y = 78;
         }
      }
      
      public function objectType() : int
      {
         return int(this.playerXML_.@type);
      }
      
      public function unlock() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:GTween = null;
         if(this._96 == false)
         {
            this._96 = true;
            this._9K_.removeChild(this._15y);
            this._15y = new FullCharBoxGraphic();
            this._9K_.addChild(this._15y);
            this.setImage(_Z_4.DOWN,_Z_4._M_J_,0);
            this._15y.addChild(this.bitmap_);
            this._15y.addChild(this.classNameText_);
            if(contains(this._ns))
            {
               removeChild(this._ns);
            }
            if(contains(this._1la))
            {
               removeChild(this._1la);
            }
            if(this._1bG_ && contains(this._1bG_))
            {
               removeChild(this._1bG_);
            }
            if(this._077 && contains(this._077))
            {
               removeChild(this._077);
            }
            if(this._1qh && contains(this._1qh))
            {
               removeChild(this._1qh);
            }
            _loc1_ = this._8R_(Star.numStars(this.model._13t(this.objectType())),Star.ClassFameLevels.length);
            _loc1_.y = 60;
            _loc1_.x = this._15y.width / 2 - _loc1_.width / 2;
            _loc1_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
            addChild(_loc1_);
            this.classNameText_.y = 74;
            if(!this.__else)
            {
               this._0P___();
            }
            addChild(this.__else);
            _loc2_ = new GTween(this.__else,2.5,{
               "alpha":0,
               "y":-30
            });
            _loc2_.onComplete = this._02o;
         }
      }
      
      private function _02o(param1:GTween) : void
      {
         removeChild(this.__else);
      }
      
      public function getTooltip() : ToolTip
      {
         return new _yj(this.playerXML_,this.model,this.charStats_);
      }
      
      public function _X_d(param1:Boolean) : void
      {
         if(!this._96)
         {
            return;
         }
         if(param1)
         {
            transform.colorTransform = new ColorTransform(1.2,1.2,1.2);
         }
         else
         {
            transform.colorTransform = new ColorTransform(1,1,1);
         }
      }
      
      private function setImage(param1:int, param2:int, param3:Number) : void
      {
         this.bitmap_.bitmapData = SavedCharacter.getImage(null,this.playerXML_,param1,param2,param3,this._96,false);
         this.bitmap_.x = this._15y.width / 2 - this.bitmap_.bitmapData.width / 2;
      }
      
      private function _8R_(param1:int, param2:int) : Sprite
      {
         var _loc3_:Sprite = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc4_:Sprite = new Sprite();
         while(_loc5_ < param1)
         {
            _loc3_ = new StarGraphic();
            _loc3_.x = _loc6_;
            _loc3_.transform.colorTransform = _U_9;
            _loc4_.addChild(_loc3_);
            _loc6_ = _loc6_ + _loc3_.width;
            _loc5_++;
         }
         while(_loc5_ < param2)
         {
            _loc3_ = new StarGraphic();
            _loc3_.x = _loc6_;
            _loc3_.transform.colorTransform = _9V_;
            _loc4_.addChild(_loc3_);
            _loc6_ = _loc6_ + _loc3_.width;
            _loc5_++;
         }
         return _loc4_;
      }
      
      public function _1M_x(param1:int) : void
      {
         if(!this._077)
         {
            this._077 = new this._1Y_U_();
            this._077.x = 38;
            this._077.y = 8;
            addChild(this._077);
         }
         if(!this._1qh)
         {
            this._0G_v();
            addChild(this._1qh);
         }
         this._1qh.setStringBuilder(new _dU_().setParams(_1O_I_._1ci,{"percent":String(param1)}));
      }
      
      private function _up() : void
      {
         this._1la = new _1gJ_(_1O_I_._13P_,13,this.cost,Currency.GOLD);
         this._1la.y = this._1la.y + this._15y.height;
         this._1la.setWidth(this._15y.width);
         this._11x = new _1mh(this._1la,MouseEvent.CLICK,MouseEvent);
      }
      
      private function _1pa() : void
      {
         this._ns = new SimpleText().setSize(14).setColor(16711680).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setTextWidth(this._15y.width);
         this._ns.setStringBuilder(new _dU_().setParams(_1O_I_.LOCKED));
         this._ns.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this._ns.y = 58;
      }
      
      private function _0G_v() : void
      {
         this._1qh = new SimpleText().setSize(14).setColor(16777215).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setTextHeight(this._077.height).setTextWidth(this._077.width);
         this._1qh.x = 42;
         this._1qh.y = 12;
      }
      
      private function _0P___() : void
      {
         this.__else = new SimpleText().setSize(14).setColor(65280).setBold(true).setAutoSize(TextFieldAutoSize.CENTER);
         this.__else.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this.__else.setStringBuilder(new _dU_().setParams(_1O_I_._1Q_z));
         this.__else.y = -20;
      }
      
      public function _1S_Q_(param1:Boolean) : void
      {
         this._1la.setEnabled(param1);
      }
   }
}
