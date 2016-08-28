package Frames
{
   import _f7.Signal;
   import com.company.assembleegameclient.game.GameSpriteBase;
   import flash.events.MouseEvent;
   import _C_._1O_I_;
   
   public class _kW_ extends Frame
   {
       
      
      public const cancel:Signal = new Signal();
      
      public const choose:Signal = new Signal(String);
      
      public var _14O_:GameSpriteBase;
      
      public var _1V_Q_:Boolean;
      
      private var _1B_f:Frames.TextInput;
      
      public function _kW_(param1:GameSpriteBase, param2:Boolean)
      {
         super(_1O_I_._1C_Q_,_1O_I_._0cV_,_1O_I_._0ka,"/chooseName");
         this._14O_ = param1;
         this._1V_Q_ = param2;
         this._1B_f = new Frames.TextInput(_1O_I_._eR_,false);
         this._1B_f.inputText_.restrict = "A-Za-z";
         var _loc3_:int = 10;
         this._1B_f.inputText_.maxChars = _loc3_;
         _O_n(this._1B_f);
         _rt(_1O_I_._0gS_,{"maxChars":_loc3_});
         _rt(_1O_I_._1yG_);
         _rt(_1O_I_._1nT_);
         cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         actionButton.addEventListener(MouseEvent.CLICK,this._E_J_);
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.cancel.dispatch();
      }
      
      private function _E_J_(param1:MouseEvent) : void
      {
         this.choose.dispatch(this._1B_f.text());
         disable();
      }
      
      public function _0gM_(param1:String) : void
      {
         this._1B_f.setErrorText(param1);
      }
   }
}
