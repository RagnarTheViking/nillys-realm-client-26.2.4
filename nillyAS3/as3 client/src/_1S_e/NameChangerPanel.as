package _1S_e
{
   import _0Z_1.Panel;
   import _f7.Signal;
   import _1gF_.SimpleText;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.text.TextFormatAlign;
   import flash.filters.DropShadowFilter;
   import _T_n._1gJ_;
   import _C_._1O_I_;
   import com.company.assembleegameclient.parameters.Parameters;
   import com.company.assembleegameclient.util.Currency;
   import _1xa._dU_;
   import com.company.assembleegameclient.ui.Button;
   import flash.events.MouseEvent;
   import com.company.assembleegameclient.ui.RankDisplay;
   import _1xa._1eo;
   import com.company.assembleegameclient.game.GameSprite;
   import com.company.assembleegameclient.objects.Player;
   
   public class NameChangerPanel extends Panel
   {
       
      
      public var chooseName:Signal;
      
      public var _1y5:Boolean;
      
      private var _00M_:SimpleText;
      
      private var _19t:Sprite;
      
      public function NameChangerPanel(param1:GameSprite, param2:int)
      {
         var _loc3_:Player = null;
         var _loc4_:String = null;
         this.chooseName = new Signal();
         super(param1);
         if(this._4e())
         {
            _loc3_ = gs_.map.player_;
            this._1y5 = _loc3_.nameChosen_;
            _loc4_ = this._01F_();
            if(this._1y5)
            {
               this._0J_V_(_loc4_);
            }
            else if(_loc3_.numStars_ < param2)
            {
               this._16q(param2);
            }
            else
            {
               this._06S_();
            }
         }
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         if(this._19t)
         {
            stage.addEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
         }
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function _4e() : Boolean
      {
         return gs_.map && gs_.map.player_;
      }
      
      private function _01F_() : String
      {
         var _loc1_:String = null;
         _loc1_ = gs_.model.getName();
         this._00M_ = new SimpleText().setSize(18).setColor(16777215).setTextWidth(WIDTH);
         this._00M_.setBold(true).setWordWrap(true).setMultiLine(true).setHorizontalAlign(TextFormatAlign.CENTER);
         this._00M_.filters = [new DropShadowFilter(0,0,0)];
         return _loc1_;
      }
      
      private function _0J_V_(param1:String) : void
      {
         this._00M_.setStringBuilder(this._1Q_y(param1));
         this._00M_.y = 0;
         addChild(this._00M_);
         var _loc2_:_1gJ_ = new _1gJ_(_1O_I_._1jk,16,Parameters._1p5,Currency.GOLD);
         _loc2_._0T_g.addOnce(this._0i5);
         this._19t = _loc2_;
         addChild(this._19t);
         this._1a3();
      }
      
      private function _0i5() : void
      {
         this._19t.x = WIDTH / 2 - this._19t.width / 2;
         this._19t.y = HEIGHT - this._19t.height / 2 - 17;
      }
      
      private function _06S_() : void
      {
         this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._Q_w));
         this._00M_.y = 6;
         addChild(this._00M_);
         var _loc1_:Button = new Button(16,_1O_I_._0kq);
         _loc1_.textChanged.addOnce(this._fR_);
         this._19t = _loc1_;
         addChild(this._19t);
         this._1a3();
      }
      
      private function _fR_() : void
      {
         this._19t.x = WIDTH / 2 - this._19t.width / 2;
         this._19t.y = HEIGHT - this._19t.height - 4;
      }
      
      private function _1a3() : void
      {
         this._19t.addEventListener(MouseEvent.CLICK,this.onButtonClick);
      }
      
      private function _16q(param1:int) : void
      {
         var _loc2_:Sprite = null;
         var _loc3_:Sprite = null;
         this._00M_.setStringBuilder(new _dU_().setParams(_1O_I_._Q_w));
         addChild(this._00M_);
         _loc2_ = new Sprite();
         var _loc4_:SimpleText = new SimpleText().setSize(16).setColor(16777215);
         _loc4_.setBold(true);
         _loc4_.setStringBuilder(new _dU_().setParams(_1O_I_._0uo));
         _loc4_.filters = [new DropShadowFilter(0,0,0)];
         _loc2_.addChild(_loc4_);
         _loc3_ = new RankDisplay(param1,false,false,0,false);
         _loc3_.x = _loc4_.width + 4;
         _loc3_.y = _loc4_.height / 2 - _loc3_.height / 2;
         _loc2_.addChild(_loc3_);
         _loc2_.x = WIDTH / 2 - _loc2_.width / 2;
         _loc2_.y = HEIGHT - _loc2_.height / 2 - 20;
         addChild(_loc2_);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,this._1I_P_);
      }
      
      private function _1Q_y(param1:String) : _1eo
      {
         return new _dU_().setParams(_1O_I_._1M_7,{"name":param1});
      }
      
      private function _1I_P_(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Parameters.data_.interact && stage.focus == null)
         {
            this._vk();
         }
      }
      
      private function onButtonClick(param1:MouseEvent) : void
      {
         this._vk();
      }
      
      private function _vk() : void
      {
         this.chooseName.dispatch();
      }
      
      public function _0cY_(param1:String) : void
      {
         this._00M_.setStringBuilder(this._1Q_y(param1));
         this._00M_.y = 0;
      }
   }
}
