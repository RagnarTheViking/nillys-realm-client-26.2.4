package _0H_A_
{
   import _0pN_._049;
   import _aW_.IWebRequest;
   import _3b.DialogSignal;
   import _1C_p.News;
   import _03U_._51;
   import flash.utils.getTimer;
   import _1C_p._16E_;
   import _1C_p._1E_X_;
   import _1O_R_.ErrorDialog;
   
   public class _0T_c extends _049 implements _ox
   {
      
      private static const _N_N_:int = 600;
       
      
      [Inject]
      public var client:IWebRequest;
      
      [Inject]
      public var _06Z_:DialogSignal;
      
      [Inject]
      public var model:News;
      
      [Inject]
      public var _jk:_51;
      
      private var _qH_:int = -1;
      
      private var _1fj:int = 0;
      
      private var _1pb:int = 600;
      
      public function _0T_c()
      {
         super();
      }
      
      override protected function startTask() : void
      {
         this._1fj++;
         if(this._qH_ == -1 || this._qH_ + this._1pb < getTimer() / 1000)
         {
            this._qH_ = getTimer() / 1000;
            this.client.complete.addOnce(this.onComplete);
            this.client.sendRequest("/app/globalNews",{"language":this._jk._lP_()});
         }
         else
         {
            _0et(true);
            reset();
         }
         if("production".toLowerCase() != "dev" && this._1pb != 0 && this._1fj >= 2)
         {
            this._1pb = 0;
         }
      }
      
      private function onComplete(param1:Boolean, param2:*) : void
      {
         if(param1)
         {
            this._0wp(param2);
         }
         else
         {
            this._0N_0(param2);
         }
         _0et(param1,param2);
         reset();
      }
      
      private function _0wp(param1:String) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Vector.<_16E_> = new Vector.<_16E_>();
         var _loc4_:Object = JSON.parse(param1);
         for each(_loc2_ in _loc4_)
         {
            _loc3_.push(this._D_Q_(_loc2_));
         }
         this.model._10x(_loc3_);
      }
      
      private function _D_Q_(param1:Object) : _16E_
      {
         var _loc2_:_16E_ = new _16E_();
         _loc2_._H_b = param1.title;
         _loc2_._1F_I_ = param1.image;
         _loc2_.linkDetail = param1.linkDetail;
         _loc2_._0Q_W_ = Number(param1.startTime);
         _loc2_._0ma = Number(param1.endTime);
         _loc2_.linkType = _1E_X_.parse(param1.linkType);
         _loc2_._0O_b = String(param1.platform).split(",");
         _loc2_.priority = uint(param1.priority);
         _loc2_.slot = uint(param1.slot);
         return _loc2_;
      }
      
      private function _0N_0(param1:String) : void
      {
         this._06Z_.dispatch(new ErrorDialog("Unable to get news data."));
      }
   }
}
