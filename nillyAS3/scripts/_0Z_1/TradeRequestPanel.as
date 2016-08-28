package _0Z_1
{
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.text.TextFieldAutoSize;
   import flash.filters.DropShadowFilter;
   import _05g._1S_m;
   
   public class TradeRequestPanel extends Panel
   {
       
      
      public var name_:String;
      
      private var _00M_:SimpleText;
      
      private var _O_8:Button;
      
      private var _0Z_X_:Button;
      
      private var _sF_:Timer;
      
      public function TradeRequestPanel(param1:GameSpriteBase, param2:String)
      {
         super(param1);
         this.name_ = param2;
         this._00M_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(WIDTH);
         this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._01c,{"name":param2}));
         this._00M_.setBold(true);
         this._00M_.setWordWrap(true).setMultiLine(true);
         this._00M_.setAutoSize(TextFieldAutoSize.CENTER);
         this._00M_.filters = [new DropShadowFilter(0,0,0)];
         this._00M_.y = 0;
         addChild(this._00M_);
         this._O_8 = new Button(16,_1O_I_._tg);
         this._O_8.addEventListener(MouseEvent.CLICK,this._0J_i);
         addChild(this._O_8);
         this._0Z_X_ = new Button(16,_1O_I_._1G_Z_);
         this._0Z_X_.addEventListener(MouseEvent.CLICK,this._13Y_);
         addChild(this._0Z_X_);
         this._sF_ = new Timer(20 * 1000,1);
         this._sF_.start();
         this._sF_.addEventListener(TimerEvent.TIMER,this._1xW_);
         var _loc3_:_1S_m = new _1S_m();
         _loc3_.pushArgs(this._O_8.textChanged,this._0Z_X_.textChanged);
         _loc3_.complete.addOnce(this.onComplete);
      }
      
      private function onComplete() : void
      {
         this._O_8.x = WIDTH / 4 - this._O_8.width / 2;
         this._0Z_X_.x = 3 * WIDTH / 4 - this._0Z_X_.width / 2;
         this._O_8.y = HEIGHT - this._O_8.height - 4;
         this._0Z_X_.y = HEIGHT - this._0Z_X_.height - 4;
      }
      
      private function _1xW_(param1:TimerEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function _0J_i(param1:MouseEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function _13Y_(param1:MouseEvent) : void
      {
         gs_.gsc_.requestTrade(this.name_);
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
