package _P_N_
{
   import com.company.assembleegameclient.game.GameSprite;
   import _3b.CloseDialogsSignal;
   import flash.events.Event;
   import com.company.googleanalytics.GA;
   import com.company.assembleegameclient.parameters.Parameters;
   import _0H_6.GameContext;
   import _C_._1O_I_;
   import _1O_R_.Dialog;
   
   public class _1bK_ extends FancyDialog
   {
       
      
      private var _14O_:GameSprite;
      
      private var _1ca:CloseDialogsSignal;
      
      public function _1bK_(param1:GameSprite)
      {
         this._1ca = GameContext.getInjector().getInstance(CloseDialogsSignal);
         this._14O_ = param1;
         super("LeavePetYardDialog.title","LeavePetYardDialog.text",_1O_I_._Y_s,_1O_I_._1J_i,null);
         addEventListener(Dialog.LEFT_BUTTON,this._fH_);
         addEventListener(Dialog.RIGHT_BUTTON,this._rc);
         _7H_.setMultiLine(true);
      }
      
      private function _fH_(param1:Event) : void
      {
         this._1ca.dispatch();
      }
      
      private function _rc(param1:Event) : void
      {
         this._14O_.gsc_.escape();
         GA.global().trackEvent("enterPortal","Nexus Button");
         Parameters.data_.needsRandomRealm = false;
         Parameters.save();
         this._1ca.dispatch();
      }
   }
}
