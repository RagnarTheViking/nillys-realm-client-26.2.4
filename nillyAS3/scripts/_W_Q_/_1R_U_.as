package _W_Q_
{
   import flash.display.Sprite;
   import _1S_e.CurrencyDisplay;
   import _f7.Signal;
   import _v4.Client;
   import _0qE_._1vk;
   import flash.events.MouseEvent;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.objects.ObjectLibrary;
   import com.company.assembleegameclient.appengine.CharList;
   import com.company.googleanalytics.GA;
   import flash.events.Event;
   import _ju._0O_M_;
   import com.company.rotmg.graphics.ScreenGraphic;
   
   public class _1R_U_ extends Sprite
   {
       
      
      private var _14G_:_W_Q_.TextButton;
      
      private var _O_i:CurrencyDisplay;
      
      private var _N_X_:Object;
      
      public var tooltip:Signal;
      
      public var close:Signal;
      
      public var selected:Signal;
      
      public var buy:Signal;
      
      private var _fk:Boolean = false;
      
      public function _1R_U_()
      {
         this._N_X_ = {};
         super();
         this.tooltip = new Signal(Sprite);
         this.selected = new Signal(int);
         this.close = new Signal();
         this.buy = new Signal(int);
         addChild(new _0O_M_());
         addChild(new TitleBasicAccountInfo());
         addChild(new ScreenGraphic());
      }
      
      public function initialize(param1:Client) : void
      {
         var _loc2_:int = 0;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:String = null;
         var _loc6_:Boolean = false;
         var _loc7_:CharacterBox = null;
         if(this._fk)
         {
            return;
         }
         this._fk = true;
         this._14G_ = new _W_Q_.TextButton(_1vk.BACK,36,false);
         this._14G_.addEventListener(MouseEvent.CLICK,this._K_B_);
         this._14G_.setVerticalAlign(SimpleText.MIDDLE);
         addChild(this._14G_);
         this._O_i = new CurrencyDisplay();
         this._O_i.draw(param1.getCredits(),param1.getFame());
         addChild(this._O_i);
         _loc2_ = 0;
         while(_loc2_ < ObjectLibrary._1bS_.length)
         {
            _loc3_ = ObjectLibrary._1bS_[_loc2_];
            _loc4_ = int(_loc3_.@type);
            _loc5_ = _loc3_.@id;
            if(!param1._1bH_(_loc5_,CharList._1wn))
            {
               _loc6_ = param1._1bH_(_loc5_,CharList._1lc);
               _loc7_ = new CharacterBox(_loc3_,param1.getCharStats()[_loc4_],param1,_loc6_);
               _loc7_.x = 50 + 140 * int(_loc2_ % 5) + 70 - _loc7_.width / 2;
               _loc7_.y = 88 + 140 * int(_loc2_ / 5);
               this._N_X_[_loc4_] = _loc7_;
               _loc7_.addEventListener(MouseEvent.ROLL_OVER,this._1xR_);
               _loc7_.addEventListener(MouseEvent.ROLL_OUT,this._1ap);
               _loc7_._L_0.add(this._1B_9);
               _loc7_._11x.add(this._1yj);
               if(_loc4_ == 784 && !_loc7_._96)
               {
                  _loc7_._1M_x(75);
               }
               addChild(_loc7_);
            }
            _loc2_++;
         }
         stage;
         this._14G_.x = 800 / 2 - this._14G_.width / 2;
         this._14G_.y = 550;
         stage;
         this._O_i.x = 800;
         this._O_i.y = 20;
         GA.global().trackPageview("/newCharScreen");
      }
      
      private function _K_B_(param1:Event) : void
      {
         this.close.dispatch();
      }
      
      private function _1xR_(param1:MouseEvent) : void
      {
         var _loc2_:CharacterBox = param1.currentTarget as CharacterBox;
         _loc2_._X_d(true);
         this.tooltip.dispatch(_loc2_.getTooltip());
      }
      
      private function _1ap(param1:MouseEvent) : void
      {
         var _loc2_:CharacterBox = param1.currentTarget as CharacterBox;
         _loc2_._X_d(false);
         this.tooltip.dispatch(null);
      }
      
      private function _1B_9(param1:MouseEvent) : void
      {
         this.tooltip.dispatch(null);
         var _loc2_:CharacterBox = param1.currentTarget.parent as CharacterBox;
         if(!_loc2_._96)
         {
            return;
         }
         var _loc3_:int = _loc2_.objectType();
         var _loc4_:String = ObjectLibrary._O_S_[_loc3_];
         GA.global().trackEvent("character","create",_loc4_);
         this.selected.dispatch(_loc3_);
      }
      
      public function _1K_o(param1:int, param2:int) : void
      {
         this._O_i.draw(param1,param2);
      }
      
      public function update(param1:Client) : void
      {
         var _loc2_:XML = null;
         var _loc3_:int = 0;
         var _loc4_:String = null;
         var _loc5_:Boolean = false;
         var _loc6_:CharacterBox = null;
         var _loc7_:int = 0;
         while(_loc7_ < ObjectLibrary._1bS_.length)
         {
            _loc2_ = ObjectLibrary._1bS_[_loc7_];
            _loc3_ = int(_loc2_.@type);
            _loc4_ = String(_loc2_.@id);
            if(!param1._1bH_(_loc4_,CharList._1wn))
            {
               _loc5_ = param1._1bH_(_loc4_,CharList._1lc);
               _loc6_ = this._N_X_[_loc3_];
               if(_loc6_)
               {
                  _loc6_._1S_Q_(true);
                  if(_loc5_ || param1._1G_H_(_loc3_))
                  {
                     _loc6_.unlock();
                  }
               }
            }
            _loc7_++;
         }
      }
      
      private function _1yj(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:CharacterBox = param1.currentTarget.parent as CharacterBox;
         if(_loc3_ && !_loc3_._96)
         {
            _loc2_ = int(_loc3_.playerXML_.@type);
            _loc3_._1S_Q_(false);
            this.buy.dispatch(_loc2_);
         }
      }
   }
}
