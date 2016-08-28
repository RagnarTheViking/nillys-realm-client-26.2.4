package _1I_S_
{
   import _P_S_.Command;
   import _05L_.ChatMessage;
   import _C_._Q_E_;
   import _05L_._05T_;
   import _1xa._dU_;
   import com.company.assembleegameclient.parameters.Parameters;
   
   public class _1J_W_ extends Command
   {
       
      
      [Inject]
      public var _1go:ChatMessage;
      
      [Inject]
      public var _qh:_Q_E_;
      
      [Inject]
      public var _O_q:_1I_S_._1vz;
      
      [Inject]
      public var model:_05T_;
      
      public function _1J_W_()
      {
         super();
      }
      
      override public function execute() : void
      {
         this._1vs();
         this._U_r();
         this.model._1vd(this._1go);
         this._O_q.dispatch(this._1go);
      }
      
      private function _U_r() : void
      {
         var _loc1_:_dU_ = null;
         var _loc2_:String = null;
         if(this._1go.name.length > 0 && this._1go.name.charAt(0) == "#")
         {
            _loc1_ = new _dU_().setParams(this._1go.name.substr(1,this._1go.name.length - 1),this._1go.tokens);
            _loc1_._0L_b(this._qh._1s9());
            _loc2_ = _loc1_.getString();
            this._1go.name = !!_loc2_?"#" + _loc2_:this._1go.name;
         }
      }
      
      private function _1vs() : void
      {
         if(this._1go.name == Parameters.ClientText || this._1go.name == Parameters.InfoText || this._1go.name == Parameters.ErrorText || this._1go.name == Parameters.HelpText || this._1go.name.charAt(0) == "#")
         {
            this._1sm();
         }
      }
      
      public function _1sm() : void
      {
         var _loc1_:_dU_ = new _dU_().setParams(this._1go.text,this._1go.tokens);
         _loc1_._0L_b(this._qh._1s9());
         var _loc2_:String = _loc1_.getString();
         this._1go.text = !!_loc2_?_loc2_:this._1go.text;
      }
   }
}
