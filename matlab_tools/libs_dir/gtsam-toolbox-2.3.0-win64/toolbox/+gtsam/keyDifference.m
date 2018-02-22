function varargout = keyDifference(varargin)
if length(varargin) == 2 && isa(varargin{1},'gtsam.KeySet') && isa(varargin{2},'gtsam.KeySet')
    varargout{1} = gtsam_wrapper(2136, varargin{:});
else
    error('Arguments do not match any overload of function gtsam.keyDifference');
end
