package _1S_e
{
   import flash.display.Sprite;
   import _05g._1S_m;
   import _1gF_.SimpleText;
   import flash.display.Bitmap;
   import com.company.assembleegameclient.game.GameSprite;
   import _f7.Signal;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.parameters.Parameters;
   import flash.filters.DropShadowFilter;
   import _ek._18o;
   import _1xa.SText;
   import com.company.assembleegameclient.util.TimeConversions;
   import _eN_._0M_5;
   import com.company.util.TextureLibrary;
   import flash.display.BitmapData;
   import com.company.assembleegameclient.util.TextureRedrawer;
   import com.company.assembleegameclient.util.Star;
   import _0H_6.GameContext;
   import kabam.rotmg.assets.services._157;
   
   public class CurrencyDisplay extends Sprite
   {
      
      private static const _Z_B_:int = 18;
      
      public static const _U_1:String = "lofiObj3";
      
      public static const _1qM_:int = 225;
      
      public static const _01T_:_1S_m = new _1S_m();
       
      
      private var _P_3:SimpleText;
      
      private var _B_Q_:SimpleText;
      
      private var _rM_:SimpleText;
      
      private var _02Y_:SimpleText;
      
      private var _Q_h:Bitmap;
      
      private var _T_m:Bitmap;
      
      private var _N_s:Bitmap;
      
      private var _credits:int = -1;
      
      private var _fame:int = -1;
      
      private var _tokens:int = -1;
      
      private var _showTokens:Boolean = false;
      
      private var _showFame:Boolean = true;
      
      private var _16b:GameSprite;
      
      public var _0mc:Signal;
      
      private var _1F_5:Number = -1;
      
      private var _1E_E_:String = "";
      
      public function CurrencyDisplay(param1:GameSprite = null, param2:Boolean = true, param3:Boolean = false, param4:Number = 0)
      {
         var _loc5_:_0M_5 = null;
         this._0mc = new Signal();
         super();
         this._showTokens = param3;
         this._showFame = param2;
         this._16b = param1;
         this._P_3 = this._1qp();
         _01T_.push(this._P_3.textChanged);
         addChild(this._P_3);
         var _loc6_:BitmapData = TextureLibrary.getBitmap(_U_1,_1qM_);
         _loc6_ = TextureRedrawer.redraw(_loc6_,40,true,0);
         this._Q_h = new Bitmap(_loc6_);
         addChild(this._Q_h);
         if(this._showFame)
         {
            this._B_Q_ = this._1qp();
            _01T_.push(this._B_Q_.textChanged);
            addChild(this._B_Q_);
            this._T_m = new Bitmap(Star._0a__());
            addChild(this._T_m);
         }
         if(this._showTokens && _18o._1Q_W_)
         {
            _loc5_ = GameContext.getInjector().getInstance(_18o).getFortune();
            if(_loc5_._1do != null)
            {
               this._1F_5 = _loc5_._1do.time;
               this._02Y_ = this._1qp(16777215);
               _01T_.push(this._02Y_.textChanged);
               this._02Y_.setStringBuilder(new SText(this._cG_()));
               addChild(this._02Y_);
               this._02Y_.visible = false;
            }
            this._rM_ = this._1qp(16777215);
            _01T_.push(this._rM_.textChanged);
            addChild(this._rM_);
            this._N_s = new Bitmap(_157._0bt());
            addChild(this._N_s);
         }
         else
         {
            this._showTokens = false;
         }
         this.draw(0,0,0);
         mouseEnabled = true;
         doubleClickEnabled = true;
         addEventListener(MouseEvent.DOUBLE_CLICK,this._C_K_,false,0,true);
         _01T_.complete.add(this._0mb);
      }
      
      private function _0mb() : void
      {
         if(this._showTokens)
         {
            this._Q_h.x = -this._Q_h.width;
            this._N_s.x = -this._Q_h.width + 10;
            this._N_s.y = 10;
            this._rM_.x = this._Q_h.x - this._rM_.width + 8;
            this._rM_.y = this._Q_h.y + this._Q_h.height / 2 - this._P_3.height / 2;
            this._02Y_.x = -this._02Y_.width - 2;
            this._02Y_.y = 33;
            this._Q_h.x = this._rM_.x - this._Q_h.width;
            this._P_3.x = this._Q_h.x - this._P_3.width + 8;
            this._P_3.y = this._Q_h.y + this._Q_h.height / 2 - this._P_3.height / 2;
         }
         else
         {
            this._Q_h.x = -this._Q_h.width;
            this._P_3.x = this._Q_h.x - this._P_3.width + 8;
            this._P_3.y = this._Q_h.y + this._Q_h.height / 2 - this._P_3.height / 2;
         }
         if(this._showFame)
         {
            this._T_m.x = this._P_3.x - this._T_m.width;
            this._B_Q_.x = this._T_m.x - this._B_Q_.width + 8;
            this._B_Q_.y = this._T_m.y + this._T_m.height / 2 - this._B_Q_.height / 2;
         }
      }
      
      private function _C_K_(param1:MouseEvent) : void
      {
         if(!this._16b || this._16b.evalIsNotInCombatMapArea() || Parameters.data_.clickForGold == true)
         {
            this._0mc.dispatch();
         }
      }
      
      public function _1qp(param1:uint = 16777215) : SimpleText
      {
         var _loc2_:SimpleText = new SimpleText().setSize(_Z_B_).setColor(param1).setTextHeight(16);
         _loc2_.filters = [new DropShadowFilter(0,0,0,1,4,4,2)];
         return _loc2_;
      }
      
      private function _14j() : void
      {
         var _loc1_:String = this._cG_();
         if(_loc1_ != this._1E_E_)
         {
            if(_loc1_ == "Ended")
            {
               this._showTokens = false;
               removeChild(this._02Y_);
               removeChild(this._N_s);
               removeChild(this._rM_);
               _18o._1Q_W_ = false;
            }
            else
            {
               this._02Y_.setStringBuilder(new SText(_loc1_));
               this._1E_E_ = _loc1_;
            }
            this._0mb();
         }
      }
      
      public function draw(param1:int, param2:int, param3:int = 0) : void
      {
         if(this._showTokens)
         {
            this._14j();
         }
         if(param1 == this._credits && this._showFame && param2 == this._fame && this._showTokens && param3 == this._tokens)
         {
            return;
         }
         this._credits = param1;
         this._P_3.setStringBuilder(new SText(this._credits.toString()));
         if(this._showFame)
         {
            this._fame = param2;
            this._B_Q_.setStringBuilder(new SText(this._fame.toString()));
         }
         if(this._showTokens)
         {
            this._tokens = param3;
            this._rM_.setStringBuilder(new SText(this._tokens.toString()));
         }
         if(_01T_.isEmpty())
         {
            this._0mb();
         }
      }
      
      public function _cG_() : String
      {
         var _loc1_:* = "";
         var _loc2_:Date = new Date();
         var _loc3_:Number = (this._1F_5 - _loc2_.time) / 1000;
         if(_loc3_ > TimeConversions.DAY_IN_SECONDS)
         {
            _loc1_ = String(Math.ceil(TimeConversions.secondsToDays(_loc3_))) + " days";
         }
         else if(_loc3_ > TimeConversions.HOUR_IN_SECONDS)
         {
            _loc1_ = String(Math.ceil(TimeConversions.secondsToHours(_loc3_))) + " hours";
         }
         else if(_loc3_ > TimeConversions.MINUTE_IN_SECONDS)
         {
            _loc1_ = String(Math.ceil(TimeConversions.secondsToMin(_loc3_))) + " minutes";
         }
         else if(_loc3_ > TimeConversions.MINUTE_IN_SECONDS / 2)
         {
            _loc1_ = "One Minute Left!";
         }
         else if(_loc3_ > 0)
         {
            _loc1_ = "Ending in a few seconds!!";
         }
         else
         {
            _loc1_ = "Ended";
         }
         return _loc1_;
      }
   }
}
