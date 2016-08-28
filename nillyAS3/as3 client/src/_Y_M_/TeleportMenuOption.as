package _Y_M_
{
   import flash.geom.ColorTransform;
   import com.company.assembleegameclient.objects.Player;
   import _1gF_.SimpleText;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import com.company.util.TextureLibrary;
   import _C_._1O_I_;
   import _1xa._dU_;
   
   public class TeleportMenuOption extends MenuItem
   {
      
      private static const _1O_Y_:ColorTransform = new ColorTransform(84 / 255,84 / 255,84 / 255);
       
      
      private var player_:Player;
      
      private var _0K_Q_:Boolean = false;
      
      private var _0I_E_:SimpleText;
      
      private var _hr:int;
      
      private var _0wT_:Shape;
      
      public function TeleportMenuOption(param1:Player)
      {
         this._0wT_ = new Shape();
         super(TextureLibrary.getBitmap("lofiInterface2",3),16777215,_1O_I_._04__);
         this.player_ = param1;
         this._0I_E_ = new SimpleText().setSize(18).setColor(16777215);
         this._0I_E_.setBold(true);
         this._0I_E_.setStringBuilder(new _dU_().setParams(_1O_I_._04__));
         this._0I_E_.x = this._0wT_.x = text_.x;
         this._0I_E_.y = this._0wT_.y = text_.y;
         this._0I_E_.textChanged.add(this.onTextChanged);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onTextChanged() : void
      {
         this._hr = this._0I_E_.textField.width;
         this._0wT_.graphics.beginFill(16711935);
         this._0wT_.graphics.drawRect(0,0,this._0I_E_.textField.width,this._0I_E_.textField.height);
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(param1:Event) : void
      {
         removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(param1:Event) : void
      {
         var _loc2_:Number = NaN;
         var _loc3_:int = this.player_._0oX_();
         if(_loc3_ > 0)
         {
            if(!contains(this._0I_E_))
            {
               addChild(this._0I_E_);
               addChild(this._0wT_);
               this._0I_E_.mask = this._0wT_;
            }
            _loc2_ = this._hr * (1 - _loc3_ / Player._16U_);
            this._0wT_.width = _loc2_;
            _Q_T_(_1O_Y_);
         }
         else
         {
            if(contains(this._0I_E_))
            {
               removeChild(this._0I_E_);
            }
            if(this._0K_Q_)
            {
               _Q_T_(_nz);
            }
            else
            {
               _Q_T_(null);
            }
         }
      }
      
      override protected function onMouseOver(param1:MouseEvent) : void
      {
         this._0K_Q_ = true;
      }
      
      override protected function onMouseOut(param1:MouseEvent) : void
      {
         this._0K_Q_ = false;
      }
   }
}
