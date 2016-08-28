package _W_Q_
{
   import flash.display.Sprite;
   import _1gF_.SimpleText;
   import flash.events.Event;
   import com.company.rotmg.graphics.ScreenGraphic;
   import _1xa._dU_;
   import _C_._1O_I_;
   import flash.filters.DropShadowFilter;
   import flash.text.TextFieldAutoSize;
   
   public class _3z extends Sprite
   {
       
      
      private var _1X_S_:SimpleText;
      
      public function _3z()
      {
         super();
         addChild(new ScreenGraphic());
         this._1X_S_ = new SimpleText().setSize(30).setColor(16777215).setBold(true);
         this._1X_S_.setStringBuilder(new _dU_().setParams(_1O_I_._0jq));
         this._1X_S_.filters = [new DropShadowFilter(0,0,0,1,4,4)];
         this._1X_S_.setAutoSize(TextFieldAutoSize.CENTER).setVerticalAlign(SimpleText.MIDDLE);
         addChild(this._1X_S_);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      protected function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         stage;
         this._1X_S_.x = 800 / 2;
         this._1X_S_.y = 550;
      }
   }
}
