package _0Z_1
{
   import _05g._1S_m;
   import _1gF_.SimpleText;
   import com.company.assembleegameclient.ui.Button;
   import flash.utils.Timer;
   import flash.events.TimerEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import flash.text.TextFieldAutoSize;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import _1xa.SText;
   
   public class _1S_9 extends Panel
   {
       
      
      private const _01T_:_1S_m = new _1S_m();
      
      public var name_:String;
      
      private var _00M_:SimpleText;
      
      private var guildName_:String;
      
      private var _1R_p:SimpleText;
      
      private var _O_8:Button;
      
      private var _0Z_X_:Button;
      
      private var _sF_:Timer;
      
      public function _1S_9(param1:GameSpriteBase, param2:String, param3:String)
      {
         super(param1);
         this.name_ = param2;
         this.guildName_ = param3;
         this._00M_ = new SimpleText().setSize(16).setColor(16777215).setTextWidth(WIDTH).setBold(true).setAutoSize(TextFieldAutoSize.CENTER).setHTML(true);
         this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._0M_p,{"playerName":param2}).setPrefix("<p align=\"center\">").setPostfix("</p>"));
         this._00M_.filters = [new DropShadowFilter(0,0,0)];
         this._00M_.y = 0;
         addChild(this._00M_);
         this._1R_p = new SimpleText().setSize(16).setColor(16777215).setTextWidth(WIDTH).setAutoSize(TextFieldAutoSize.CENTER).setBold(true).setHTML(true);
         this._1R_p.setStringBuilder(new SText("<p align=\"center\">" + this.guildName_ + "</p>"));
         this._1R_p.filters = [new DropShadowFilter(0,0,0)];
         this._1R_p.y = 20;
         addChild(this._1R_p);
         this._O_8 = new Button(16,_1O_I_._0zS_);
         this._O_8.addEventListener(MouseEvent.CLICK,this._0J_i);
         this._01T_.push(this._O_8.textChanged);
         addChild(this._O_8);
         this._0Z_X_ = new Button(16,_1O_I_._17o);
         this._0Z_X_.addEventListener(MouseEvent.CLICK,this._13Y_);
         this._01T_.push(this._0Z_X_.textChanged);
         addChild(this._0Z_X_);
         this._sF_ = new Timer(20 * 1000,1);
         this._sF_.start();
         this._sF_.addEventListener(TimerEvent.TIMER,this._1xW_);
         this._01T_.complete.addOnce(this.alignUI);
      }
      
      private function alignUI() : void
      {
         this._O_8.x = WIDTH / 4 - this._O_8.width / 2;
         this._O_8.y = HEIGHT - this._O_8.height - 4;
         this._0Z_X_.x = 3 * WIDTH / 4 - this._0Z_X_.width / 2;
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
         gs_.gsc_.joinGuild(this.guildName_);
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}
