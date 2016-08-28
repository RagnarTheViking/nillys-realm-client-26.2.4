package _4Z_
{
   import _f7.Signal;
   import _17B_._0o;
   import flash.filters.ColorMatrixFilter;
   import _C_._1O_I_;
   import flash.events.MouseEvent;
   import _1F_z._1Z_D_;
   import _1xa.AppendingLineBuilder;
   import _1F_z._of;
   import flash.geom.ColorTransform;
   import com.company.util.MoreColorUtil;
   
   public class _1T_i extends _08i
   {
       
      
      public const _0__W_:Signal = new Signal();
      
      public var _R_6:Boolean = false;
      
      public var _J_q:Boolean = false;
      
      private var _3q:_0o;
      
      private var _0sK_:ColorMatrixFilter;
      
      public function _1T_i()
      {
         this._3q = new _0o();
         this._0sK_ = new ColorMatrixFilter(MoreColorUtil._iz);
         super();
         addEventListener(MouseEvent.CLICK,this._19);
         this.updateTitle();
      }
      
      public function updateTitle() : void
      {
         if(!_O_M_ || contains(_O_M_))
         {
            setTitle(_1O_I_._0uK_,{});
         }
      }
      
      private function _19(param1:MouseEvent) : void
      {
         if(!this._J_q)
         {
            this._0__W_.dispatch();
         }
      }
      
      private function _0mr(param1:_1Z_D_) : void
      {
         _O_M_ && removeChild(_O_M_);
         _O_M_ = this._3q.create(param1,48);
         addChild(_O_M_);
         _1B_t();
      }
      
      public function _G_4(param1:_1Z_D_) : void
      {
         var _loc2_:AppendingLineBuilder = null;
         if(param1)
         {
            this._0mr(param1);
            setTitle(_1O_I_._1N_q,{"data":param1.getName()});
            _loc2_ = new AppendingLineBuilder();
            _loc2_.pushParams(param1._1b8());
            this._R_6 && _loc2_.pushParams(_of._1s0(param1._1lu()));
            setDescription(_1O_I_._1N_q,{"data":_loc2_});
         }
      }
      
      public function _0bC_(param1:Boolean) : void
      {
         var _loc2_:ColorTransform = null;
         if(this._J_q != param1)
         {
            this._J_q = param1;
            _O_M_.filters = !!param1?[this._0sK_]:[];
            _loc2_ = !!param1?MoreColorUtil._J_J_:new ColorTransform();
            _O_M_.transform.colorTransform = _loc2_;
         }
      }
   }
}
