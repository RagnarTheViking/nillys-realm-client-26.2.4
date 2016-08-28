package _0pN_
{
   import flash.errors.IllegalOperationError;
   import _f7.Signal;
   
   public class _049 implements _1nd
   {
       
      
      private var _1V_N_:_0pN_._5s;
      
      private var _1hG_:_0pN_._7y;
      
      private var _0D_R_:_0pN_._7y;
      
      private var _0dZ_:Boolean;
      
      private var _0a6:Boolean;
      
      private var _1H_K_:Boolean;
      
      private var _08J_:String;
      
      public function _049()
      {
         super();
      }
      
      public final function start() : void
      {
         if(!this._0dZ_)
         {
            this._0dZ_ = true;
            this._1V_N_ && this._1V_N_.dispatch(this);
            this.startTask();
         }
      }
      
      public final function reset() : void
      {
         if(this._0dZ_)
         {
            this._0dZ_ = false;
            if(!this._0a6)
            {
               throw new IllegalOperationError("Unable to Task.reset() when a task is ongoing");
            }
         }
         this._1V_N_ && this._1V_N_.removeAll();
         this._1hG_ && this._1hG_.removeAll();
         this._0D_R_ && this._0D_R_.removeAll();
         this.onReset();
      }
      
      protected function startTask() : void
      {
      }
      
      protected function onReset() : void
      {
      }
      
      protected final function _0et(param1:Boolean, param2:String = "") : void
      {
         this._1H_K_ = param1;
         this._08J_ = param2;
         this._0a6 = true;
         this._1hG_ && this._1hG_.dispatch(this,param1,param2);
         this._0D_R_ && this._0D_R_.dispatch(this,param1,param2);
      }
      
      public final function get _1uc() : Signal
      {
         return this._1V_N_ = this._1V_N_ || new _0pN_._5s();
      }
      
      public final function get _0P_3() : _0pN_._7y
      {
         return this._1hG_ = this._1hG_ || new _0pN_._7y();
      }
      
      public final function get lastly() : _0pN_._7y
      {
         return this._0D_R_ = this._0D_R_ || new _0pN_._7y();
      }
      
      public function get _1Z_M_() : Boolean
      {
         return this._0dZ_;
      }
      
      public function get _1rS_() : Boolean
      {
         return this._0a6;
      }
      
      public function get _X_z() : Boolean
      {
         return this._1H_K_;
      }
      
      public function get error() : String
      {
         return this._08J_;
      }
   }
}
