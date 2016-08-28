package _1S_e
{
   import _0jo._1N_E_;
   import com.company.assembleegameclient.game.__set;
   
   public class _1rq
   {
       
      
      [Inject]
      public var _hc:_1N_E_;
      
      [Inject]
      public var view:_1S_e.GiftDisplay;
      
      [Inject]
      public var _05H_:__set;
      
      public function _1rq()
      {
         super();
      }
      
      public function initialize() : void
      {
         this._hc.add(this._0gV_);
         if(this._05H_._0N_p)
         {
            this.view._16X_();
         }
         else
         {
            this.view._U_g();
         }
      }
      
      private function _0gV_() : void
      {
         if(this._05H_._0N_p)
         {
            this.view._16X_();
         }
         else
         {
            this.view._U_g();
         }
      }
   }
}
