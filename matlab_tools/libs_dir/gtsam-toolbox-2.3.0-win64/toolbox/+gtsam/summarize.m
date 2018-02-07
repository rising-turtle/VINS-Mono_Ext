function varargout = summarize(varargin)
if length(varargin) == 3 && isa(varargin{1},'gtsam.NonlinearFactorGraph') && isa(varargin{2},'gtsam.Values') && isa(varargin{3},'gtsam.KeySet')
    [ varargout{1} varargout{2} ] = gtsam_wrapper(2154, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.summarize');
end
