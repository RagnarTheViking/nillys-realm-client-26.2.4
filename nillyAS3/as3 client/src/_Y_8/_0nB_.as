package _Y_8
{
   import _P_S_.Mediator;
   import _05L_._05T_;
   import _1I_S_._0J_a;
   import _1I_S_._1d5;
   import _1I_S_._1vz;
   import _2l.ClientSettings;
   import _05L_.ChatMessage;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _0nB_ extends Mediator
   {
       
      
      [Inject]
      public var view:_Y_8._0Y_d;
      
      [Inject]
      public var model:_05T_;
      
      [Inject]
      public var _0D_X_:_0J_a;
      
      [Inject]
      public var _0P_X_:_1d5;
      
      [Inject]
      public var _O_q:_1vz;
      
      [Inject]
      public var _0R_b:_Y_8._0B_R_;
      
      [Inject]
      public var setup:ClientSettings;
      
      public function _0nB_()
      {
         super();
      }
      
      override public function initialize() : void
      {
         var _loc1_:ChatMessage = null;
         this.view.setup(this.model);
         for each(_loc1_ in this.model._1i3)
         {
            this.view._1iO_(this._0R_b.make(_loc1_,true));
         }
         this.view._1U_e();
         this._0D_X_.add(this._0lz);
         this._0P_X_.add(this._1Z_N_);
         this._O_q.add(this._bW_);
         this._bW_(ChatMessage.make(Parameters.ClientText,this._1x9()));
      }
      
      override public function destroy() : void
      {
         this._0D_X_.remove(this._0lz);
         this._0P_X_.remove(this._1Z_N_);
         this._O_q.remove(this._bW_);
      }
      
      private function _0lz(param1:Boolean, param2:String) : void
      {
         this.view.y = this.model.chat.height - (!!param1?this.model._A_x:0);
      }
      
      private function _1Z_N_(param1:int) : void
      {
         if(param1 > 0)
         {
            this.view._0V_();
         }
         else if(param1 < 0)
         {
            this.view._H_H_();
         }
      }
      
      private function _bW_(param1:ChatMessage) : void
      {
         this.view._1iO_(this._0R_b.make(param1));
      }
      
      private function _1x9() : String
      {
         var _loc1_:String = this.setup.Name();
         return _loc1_.replace(/<font .+>(.+)<\/font>/g,"$1");
      }
   }
}
