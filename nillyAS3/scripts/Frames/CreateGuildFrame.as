package Frames
{
   import _f7.Signal;
   import com.company.assembleegameclient.game.GameSprite;
   import flash.events.MouseEvent;
   import _1iT_._0J_1;
   import com.company.assembleegameclient.objects.Player;
   import _0H_6.GameContext;
   import _ge._v1;
   import com.company.assembleegameclient.parameters.Parameters;
   import _C_._1O_I_;
   
   public class CreateGuildFrame extends Frame
   {
       
      
      public const close:Signal = new Signal();
      
      private var name_:Frames.TextInput;
      
      private var gs_:GameSprite;
      
      public function CreateGuildFrame(param1:GameSprite)
      {
         super(_1O_I_._11u,_1O_I_._0cV_,_1O_I_._0Q_v,"/createGuild");
         this.gs_ = param1;
         this.name_ = new Frames.TextInput(_1O_I_._14o,false);
         this.name_.inputText_.restrict = "A-Za-z ";
         var _loc2_:int = 20;
         this.name_.inputText_.maxChars = _loc2_;
         _O_n(this.name_);
         _rt(_1O_I_._0gS_,{"maxChars":_loc2_});
         _rt(_1O_I_._1yG_);
         _rt(_1O_I_._88);
         cancelButton.addEventListener(MouseEvent.CLICK,this.onCancel);
         actionButton.addEventListener(MouseEvent.CLICK,this._cc);
      }
      
      private function onCancel(param1:MouseEvent) : void
      {
         this.close.dispatch();
      }
      
      private function _cc(param1:MouseEvent) : void
      {
         this.gs_.addEventListener(_0J_1._sY_,this._I_);
         this.gs_.gsc_.createGuild(this.name_.text());
         disable();
      }
      
      private function _I_(param1:_0J_1) : void
      {
         var _loc2_:Player = null;
         this.gs_.removeEventListener(_0J_1._sY_,this._I_);
         if(param1.success_)
         {
            _loc2_ = GameContext.getInjector().getInstance(_v1).player;
            if(_loc2_ != null)
            {
               _loc2_.currentFame_ = _loc2_.currentFame_ - Parameters._R_f;
            }
            this.close.dispatch();
         }
         else
         {
            this.name_.setErrorText(param1._B_z,param1._1Y_e);
            _0F_M_();
         }
      }
   }
}
