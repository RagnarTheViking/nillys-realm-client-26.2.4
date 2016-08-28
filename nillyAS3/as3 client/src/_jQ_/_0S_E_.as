package _jQ_
{
   import _0wP_._ou;
   import _0wP_.MessageProvider;
   import _wi.Injector;
   import _0wP_._H_M_;
   
   public class _0S_E_ implements _ou, MessageProvider
   {
      
      private static const _0bM_:int = 256;
       
      
      private const _1zd:Vector.<_jQ_.MessageCenterMapping> = new Vector.<_jQ_.MessageCenterMapping>(_0bM_,true);
      
      private const _0c2:Vector.<_jQ_._1G_I_> = new Vector.<_jQ_._1G_I_>(_0bM_,true);
      
      private var _T_X_:Injector;
      
      public function _0S_E_()
      {
         super();
      }
      
      public function setInjector(param1:Injector) : _0S_E_
      {
         this._T_X_ = param1;
         return this;
      }
      
      public function map(param1:int) : _H_M_
      {
         return this._1zd[param1] = this._1zd[param1] || this._x__(param1);
      }
      
      public function _1kw(param1:int) : void
      {
         this._0c2[param1] && this._0c2[param1].dispose();
         this._0c2[param1] = null;
         this._1zd[param1] = null;
      }
      
      private function _x__(param1:int) : _jQ_.MessageCenterMapping
      {
         return new _jQ_.MessageCenterMapping().setInjector(this._T_X_).setID(param1) as _jQ_.MessageCenterMapping;
      }
      
      public function require(param1:int) : Message
      {
         var _loc2_:_jQ_._1G_I_ = this._0c2[param1] = this._0c2[param1] || this._14p(param1);
         return _loc2_._0U_l();
      }
      
      private function _14p(param1:uint) : _jQ_._1G_I_
      {
         var _loc2_:_jQ_.MessageCenterMapping = this._1zd[param1];
         return !!_loc2_?_loc2_._14p():null;
      }
   }
}
